# Extra logadm rules for kumquat webservices

# webserver
logadm -w '/var/log/httpd/access_log'    -A 7d -p 1d -c -N -m 640
logadm -w '/var/log/httpd/error_log'     -A 7d -p 1d -c -N -m 640
logadm -w '/var/www/*/logs/*.log'        -A 7d -p 1d -c -N

# proftpd
logadm -w '/var/log/proftpd/proftpd.log' -A 7d -p 1d -c -N -m 640
logadm -w '/var/log/proftpd/xferlog'     -A 7d -p 1d -c -N -m 640

# php
logadm -w '/var/log/php-fpm.log'         -A 7d -p 1d -c -N -m 640

