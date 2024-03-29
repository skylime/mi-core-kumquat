#!/bin/bash
## Setup kumquat configuration

UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data
MYSQL_ROOT_PW=$(mdata-get mysql_pw)
MYSQL_KUMQUAT_PW=$(/opt/core/bin/mdata-create-password.sh -m mysql_kumquat_pw)

ALLOWED_HOST=$(hostname)
SECRET_KEY=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-100})

# Migrate from kumquat_admin to kumquat_admin_initial_pw
if mdata-get kumquat_admin >/dev/null 2>/dev/null; then
	mdata-get kumquat_admin | mdata-put kumquat_admin_initial_pw
	mdata-delete kumquat_admin
fi

KUMQUAT_ADMIN_INITIAL_PW=$(/opt/core/bin/mdata-create-password.sh -m kumquat_admin_initial_pw)
KUMQUAT_ROOT_PW=$(/opt/core/bin/mdata-create-password.sh -m kumquat_root_pw)

WWW_UID=$(id -u www)
WWW_GID=$(id -g www)

CORE_MAIL_TOKEN=${CORE_MAIL_TOKEN:-$(mdata-get core_mail_token 2>/dev/null)} || \
CORE_MAIL_TOKEN=$(od -An -N8 -x /dev/random | head -1 | tr -d ' ');
mdata-put core_mail_token ${CORE_MAIL_TOKEN}

# check if database not exists
if [[ ! -d /var/mysql/kumquat ]]; then
	# create kumquat mysql database, user and privileges
	KUMQUAT_INIT="CREATE DATABASE IF NOT EXISTS kumquat;
	CREATE USER 'kumquat'@'localhost' IDENTIFIED BY '${MYSQL_KUMQUAT_PW}';
	CREATE USER 'kumquat'@'127.0.0.1' IDENTIFIED BY '${MYSQL_KUMQUAT_PW}';
	GRANT ALL PRIVILEGES ON kumquat.* TO 'kumquat'@'localhost';
	GRANT ALL PRIVILEGES ON kumquat.* TO 'kumquat'@'127.0.0.1';
	FLUSH PRIVILEGES;"
	
	mysql --user=root --password=${MYSQL_ROOT_PW} -e "${KUMQUAT_INIT}" >/dev/null || \
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
##
## core-kumquat overwrite
##
# Make this unique, and don't share it with anybody.
SECRET_KEY = "${SECRET_KEY}"

# Disable Debug mode
DEBUG = False

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
                'PASSWORD': "${MYSQL_KUMQUAT_PW}",
        },
        'kumquat_mysql': {
                'ENGINE':   'django.db.backends.mysql',
                'HOST':     'localhost',
                'USER':     'root',
                'PASSWORD': "${MYSQL_ROOT_PW}",
        }
}

# LE
LETSENCRYPT_ACME_SERVER  = 'https://acme-v02.api.letsencrypt.org/directory'
LETSENCRYPT_ACME_FOLDER  = '/var/letsencrypt/acme/.well-known/acme-challenge/'
LETSENCRYPT_STATE_FOLDER = '/var/letsencrypt/state/'

# Kumquat
KUMQUAT_SITE_NAME        = "${ALLOWED_HOST}"
KUMQUAT_CERT_PATH        = '/opt/local/etc/kumquat/ssl/'
KUMQUAT_VHOST_CONFIG     = '/opt/local/etc/httpd/vhosts/vhosts.conf'
KUMQUAT_VHOST_ROOT       = '/var/www/'
KUMQUAT_VHOST_ERROR_LOG       = '/var/www/{vhost}/logs/error.log'
KUMQUAT_VHOST_UID             = ${WWW_UID}
KUMQUAT_VHOST_GID             = ${WWW_GID}
KUMQUAT_VHOST_POST_DELETE_CMD = ['/opt/core/bin/kumquat-vhost-post-delete.sh']
KUMQUAT_USE_ZFS          = ${USE_ZFS}
KUMQUAT_VHOST_DATASET    = "${VHOST_DATASET}"
KUMQUAT_WEBSERVER_RELOAD = 'svcadm refresh apache'
KUMQUAT_PHPMYADMIN_URL   = "${KUMQUAT_PHPMYADMIN_URL}"
KUMQUAT_WEBMAIL_URL      = "${KUMQUAT_WEBMAIL_URL}"
KUMQUAT_CRONJOB_CMD      = ['sudo', '-u', 'www', 'crontab']
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

## Lookup correct email address
KUMQUAT_EMAIL=''
if mdata-get mail_adminaddr 1>/dev/null 2>&1; then
	KUMQUAT_EMAIL=$(mdata-get mail_adminaddr)
fi
## Create root user (Django SuperAdmin for operator)
cat <<eof | /opt/kumquat/manage.py shell
from django.contrib.auth import get_user_model
user = get_user_model()
user.objects.filter(username="root").exists() or \
    user.objects.create_superuser("root", "${KUMQUAT_EMAIL}", "${KUMQUAT_ROOT_PW}")
eof

## Create admin user (Django SuperAdmin for customer)
# Overwrite kumquat email address if admin email is available
if mdata-get kumquat_admin_email 1>/dev/null 2>&1; then
	KUMQUAT_EMAIL=$(mdata-get kumquat_admin_email)
fi
# Create django superuser
cat <<eof | /opt/kumquat/manage.py shell
from django.contrib.auth import get_user_model
user = get_user_model()
user.objects.filter(username="admin").exists() or \
    user.objects.create_superuser("admin", "${KUMQUAT_EMAIL}", "${KUMQUAT_ADMIN_INITIAL_PW}")
eof

# Run update_vhosts once
(cd /opt/kumquat/; ./manage.py update_vhosts)

# Create cronjobs for kumquat
CRON="0 * * * * (cd /opt/kumquat/; ./manage.py update_vhosts)
0,15,30,45 * * * * (cd /opt/kumquat/; ./manage.py delete_vhosts)
1,11,21,31,41,51 * * * * (cd /opt/kumquat; ./manage.py update_cronjobs)
0,5,10,15,20,25,30,35,40,45,50,55 * * * * (su letsencrypt -c 'cd /opt/kumquat; ./manage.py letsencrypt')"
(crontab -l 2>/dev/null || true; echo "$CRON" ) | sort | uniq | crontab

# Enable gunicorn and kumquat backend
svcadm enable svc:/application/kumquat:backend
svcadm enable svc:/network/gunicorn:kumquat
