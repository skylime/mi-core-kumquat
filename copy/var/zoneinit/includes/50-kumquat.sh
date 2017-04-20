#!/bin/bash
## Setup kumquat configuration

UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data
MYSQL_ROOT=$(mdata-get mysql_pw)
MYSQL_KUMQUAT=${MYSQL_KUMQUAT:-$(mdata-get mysql_kumquat_pw 2>/dev/null)} || \
MYSQL_KUMQUAT=$(od -An -N8 -x /dev/random | head -1 | tr -d ' ');
mdata-put mysql_kumquat_pw "${MYSQL_KUMQUAT}"

ALLOWED_HOST=$(hostname)
SECRET_KEY=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-100})

ADMIN_KUMQUAT=${ADMIN_KUMQUAT:-$(mdata-get kumquat_admin 2>/dev/null)} || \
ADMIN_KUMQUAT=$(od -An -N8 -x /dev/random | head -1 | tr -d ' ');
mdata-put kumquat_admin ${ADMIN_KUMQUAT}

WWW_UID=$(id -u www)
WWW_GID=$(id -g www)

CORE_MAIL_TOKEN=${CORE_MAIL_TOKEN:-$(mdata-get core_mail_token 2>/dev/null)} || \
CORE_MAIL_TOKEN=$(od -An -N8 -x /dev/random | head -1 | tr -d ' ');
mdata-put core_mail_token ${CORE_MAIL_TOKEN}

# check if database not exists
if [[ ! -d /var/mysql/kumquat ]]; then
	# create kumquat mysql database, user and privileges
	KUMQUAT_INIT="CREATE DATABASE IF NOT EXISTS kumquat;
	CREATE USER 'kumquat'@'localhost' IDENTIFIED BY '${MYSQL_KUMQUAT}';
	CREATE USER 'kumquat'@'127.0.0.1' IDENTIFIED BY '${MYSQL_KUMQUAT}';
	GRANT ALL PRIVILEGES ON kumquat.* TO 'kumquat'@'localhost';
	GRANT ALL PRIVILEGES ON kumquat.* TO 'kumquat'@'127.0.0.1';
	FLUSH PRIVILEGES;"
	
	mysql --user=root --password=${MYSQL_ROOT} -e "${KUMQUAT_INIT}" >/dev/null || \
	  ( log "ERROR MySQL query failed to execute." && exit 31 )
	DB_CREATED=true
fi

# copy generated settings
if zfs list ${DDS} 1>/dev/null 2>&1; then
	USE_ZFS='True'
	VHOST_DATASET=${DDS}'/www'
else
	USE_ZFS='False'
	VHOST_DATASET=''
fi

# phpMyAdmin URL
if ! mdata-get phpmyadmin_allow 1>/dev/null 2>&1; then
	if mdata-get phpmyadmin_url 1>/dev/null 2>&1; then
		KUMQUAT_PHPMYADMIN_URL=$(mdata-get phpmyadmin_url)
	else
		KUMQUAT_PHPMYADMIN_URL='/phpmyadmin/'
	fi
fi

# Webmail URL
if mdata-get webmail_url 1>/dev/null 2>&1; then
	KUMQUAT_WEBMAIL_URL=$(mdata-get webmail_url)
fi

cat >> /opt/kumquat/kumquat_web/settings.py <<EOF
# Make this unique, and don't share it with anybody.
SECRET_KEY = "${SECRET_KEY}"

# Allow only the hostname and localhost to access
ALLOWED_HOSTS = ['127.0.0.1', 'localhost', '${ALLOWED_HOST}']

# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases
DATABASES = {
        'default': {
                'ENGINE':   'django.db.backends.mysql',
                'NAME':     'kumquat',
                'HOST':     'localhost',
                'USER':     'kumquat',
                'PASSWORD': "${MYSQL_KUMQUAT}",
        },
        'kumquat_mysql': {
                'ENGINE':   'django.db.backends.mysql',
                'HOST':     'localhost',
                'USER':     'root',
                'PASSWORD': "${MYSQL_ROOT}",
        }
}

# Kumquat
KUMQUAT_CERT_PATH        = '/opt/local/etc/kumquat/ssl/'
KUMQUAT_VHOST_CONFIG     = '/opt/local/etc/httpd/vhosts/vhosts.conf'
KUMQUAT_VHOST_ROOT       = '/var/www/'
KUMQUAT_VHOST_ERROR_LOG  = '/var/www/{vhost}/logs/error.log'
KUMQUAT_VHOST_UID        = ${WWW_UID}
KUMQUAT_VHOST_GID        = ${WWW_GID}
KUMQUAT_USE_ZFS          = ${USE_ZFS}
KUMQUAT_VHOST_DATASET    = "${VHOST_DATASET}"
KUMQUAT_WEBSERVER_RELOAD = 'svcadm refresh apache'
KUMQUAT_PHPMYADMIN_URL   = "${KUMQUAT_PHPMYADMIN_URL}"
KUMQUAT_WEBMAIL_URL      = "${KUMQUAT_WEBMAIL_URL}"
CORE_MAIL_TOKEN          = "${CORE_MAIL_TOKEN}"
EOF

# valid whitelist values are described at https://mail.core.io/api/
# set this to None (or leave it undefined) to whitelist the same domain as the account
if mdata-get core_mail_whitelist 2>/dev/null; then
	echo "CORE_MAIL_WHITELIST = \"$(mdata-get core_mail_whitelist)\"" \
		>> /opt/kumquat/kumquat_web/settings.py
fi

# Init django data and create admin user
/opt/kumquat/manage.py migrate --noinput --fake-initial

# Create superadmin user
KUMQUAT_ADMIN_EMAIL=''
if mdata-get kumquat_admin_email 1>/dev/null 2>&1; then
	KUMQUAT_ADMIN_EMAIL=$(mdata-get kumquat_admin_email)
elif mdata-get mail_adminaddr 1>/dev/null 2>&1; then
	KUMQUAT_ADMIN_EMAIL=$(mdata-get mail_adminaddr)
fi

if [[ ${DB_CREATED} == true ]]; then
	echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', '${KUMQUAT_ADMIN_EMAIL}', '${ADMIN_KUMQUAT}')" \
		| /opt/kumquat/manage.py shell
fi

# Run update_vhosts once
(cd /opt/kumquat/; ./manage.py update_vhosts)

# Create cronjobs for kumquat
CRON="0 * * * * (cd /opt/kumquat/; ./manage.py update_vhosts)
0,15,30,45 * * * * (cd /opt/kumquat/; ./manage.py delete_vhosts)
1,11,21,31,41,51 * * * * (cd /opt/kumquat; ./manage.py update_cronjobs)
0,5,10,15,20,25,30,35,40,45,55 * * * * (su letsencrypt -c 'cd /opt/kumquat; ./manage.py letsencrypt')"
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab

# Enable gunicorn and kumquat backend
svcadm enable svc:/application/kumquat:backend
svcadm enable svc:/network/gunicorn:kumquat
