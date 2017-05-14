#!/usr/bin/env bash
start=`date +%s`

# Setup hostname for kumquat config
sed -i "s:HOSTNAME:$(hostname):g" /opt/local/etc/httpd/vhosts/01-kumquat.conf

# Enable apache by default
/usr/sbin/svcadm enable svc:/pkgsrc/apache:default

end=`date +%s`
log "debug (sec): $((end-start))"
