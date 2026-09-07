#!/usr/bin/env bash

# Configure PHP sendmail return-path if possible
if mdata-get kumquat_admin_email 1> /dev/null 2>&1; then
  echo "php_admin_value[sendmail_path] = /usr/sbin/sendmail -t -i -f $(mdata-get kumquat_admin_email)" \
    >> /opt/local/etc/php/{7.4,8.2,8.4}/php-fpm.d/www.conf
fi

# Configure default pm for PHP-FPM (3 pools exists, ~40 MB per worker expected)
/opt/core/bin/php-fpm-settings-gen.sh -p 3 -w 40 >> /opt/local/etc/php/{7.4,8.2,8.4}/php-fpm.d/www.conf

# Enable PHP-FPM
/usr/sbin/svcadm enable svc:/pkgsrc/php-fpm74:default
/usr/sbin/svcadm enable svc:/pkgsrc/php-fpm82:default
/usr/sbin/svcadm enable svc:/pkgsrc/php-fpm84:default
