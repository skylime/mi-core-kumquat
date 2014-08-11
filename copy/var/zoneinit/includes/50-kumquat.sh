#!/bin/bash
## Setup kumquat configuration

UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data
MYSQL_ROOT=$(mdata-get mysql_pw)
MYSQL_KUMQUAT=

# create kumquat mysql database
echo "CREATE DATABASE IF NOT EXISTS kumquat" |\
	mysql --user=root --password=${MYSQL_ROOT}

# create kumquat mysql user
echo "CREATE USER 'kumquat'@'localhost' IDENTIFIED BY '${MYSQL_KUMQUAT}';
	CREATE USER 'kumquat'@'127.0.0.1' IDENTIFIED BY '${MYSQL_KUMQUAT}';'" |\
	mysql --user=root --password=${MYSQL_ROOT}

# grand privileges
echo "GRANT ALL PRIVILEGES ON kumquat.* TO 'kumquat'@'localhost';
	GRANT ALL PRIVILEGES ON kumquat.* TO 'kumquat'@'127.0.0.1';" |\
	mysql --user=root --password=${MYSQL_ROOT}

# flush privs
echo "FLUSH PRIVILEGES;" |\
	mysql --user=root --password=${MYSQL_ROOT}

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
KUMQUAT_VHOST_UID        = www
KUMQUAT_VHOST_GID        = www
KUMQUAT_USE_ZFS          = ${USE_ZFS}
KUMQUAT_VHOST_DATASET    = "${VHOST_DATASET}"
KUMQUAT_WEBSERVER_RELOAD = 'svcadm refresh apache'
EOF
