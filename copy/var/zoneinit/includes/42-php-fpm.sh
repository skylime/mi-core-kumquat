#!/usr/bin/env bash

# Configure PHP sendmail return-path if possible
if mdata-get kumquat_admin_email 1>/dev/null 2>&1; then
	echo "php_admin_value[sendmail_path] = /usr/sbin/sendmail -t -i -f $(mdata-get kumquat_admin_email)" \
		>> /opt/local/etc/fpm.d/pool-www.conf
fi

# Enable PHP-FPM
/usr/sbin/svcadm enable svc:/pkgsrc/php-fpm:default
