#!/bin/bash
# Configure kumquat

HOSTNAME=$(hostname)

# Setup hostname for kumquat config
sed -i "s:HOSTNAME:${HOSTNAME}:g" /opt/local/etc/httpd/01-kumquat.conf
