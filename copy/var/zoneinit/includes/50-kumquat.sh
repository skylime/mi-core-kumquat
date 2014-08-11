#!/bin/bash
## Setup kumquat configuration

UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data
MYSQL_ROOT=$(mdata-get mysql_pw)
MYSQL_KUMQUAT=${MYSQL_KUMQUAT:-$(mdata-get mysql_kumquat_pw 2>/dev/null)} || \
MYSQL_KUMQUAT=$(od -An -N8 -x /dev/random | head -1 | tr -d ' ');
mdata-put mysql_kumquat_pw "${MYSQL_KUMQUAT}"

# check if database exists already
if [ -d /var/mysql/kumquat ]; then
	echo 'Database already exists, maybe some migration script will run in the future.'
	exit 0
fi

# create kumquat mysql database, user and privileges
KUMQUAT_INIT="CREATE DATABASE IF NOT EXISTS kumquat;
CREATE USER 'kumquat'@'localhost' IDENTIFIED BY '${MYSQL_KUMQUAT}';
CREATE USER 'kumquat'@'127.0.0.1' IDENTIFIED BY '${MYSQL_KUMQUAT}';
GRANT ALL PRIVILEGES ON kumquat.* TO 'kumquat'@'localhost';
GRANT ALL PRIVILEGES ON kumquat.* TO 'kumquat'@'127.0.0.1';
FLUSH PRIVILEGES;"

mysql --user=root --password=${MYSQL_ROOT} -e "${KUMQUAT_INIT}" >/dev/null || \
  ( log "ERROR MySQL query failed to execute." && exit 31 )

# copy generated settings
if zfs list ${DDS} 1>/dev/null 2>&1; then
	USE_ZFS='True'
	VHOST_DATASET=${DDS}'/www'
else
	USE_ZFS='False'
	VHOST_DATASET=''
fi

cat >> /opt/kumquat/kumquat_web/settings.py <<EOF
# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases
DATABASES = {
        'default': {
                'ENGINE':   'django.db.backends.mysql',
                'NAME':     'kumquat',
                'HOST':     '127.0.0.1',
                'USER':     'kumquat',
                'PASSWORD': "${MYSQL_KUMQUAT}",
        },
        'kumquat_mysql': {
                'ENGINE':   'django.db.backends.mysql',
                'HOST':     '127.0.0.1',
                'USER':     'root',
                'PASSWORD': "${MYSQL_ROOT}",
        }
}

# Kumquat
KUMQUAT_CERT_PATH        = '/opt/local/etc/httpd/ssl/'
KUMQUAT_VHOST_CONFIG     = '/opt/local/etc/httpd/vhosts/vhosts.conf'
KUMQUAT_VHOST_ROOT       = '/var/www/'
KUMQUAT_VHOST_UID        = 'www'
KUMQUAT_VHOST_GID        = 'www'
KUMQUAT_USE_ZFS          = ${USE_ZFS}
KUMQUAT_VHOST_DATASET    = "${VHOST_DATASET}"
KUMQUAT_WEBSERVER_RELOAD = 'svcadm refresh apache'
EOF
