#!/usr/bin/env bash

# Setup hostname for kumquat config
sed -i "s:HOSTNAME:$(hostname):g" /opt/local/etc/httpd/vhosts/00-default.conf
sed -i "s:HOSTNAME:$(hostname):g" /opt/local/etc/httpd/vhosts/01-kumquat.conf

# Enable apache by default
/usr/sbin/svcadm enable svc:/pkgsrc/apache:default
