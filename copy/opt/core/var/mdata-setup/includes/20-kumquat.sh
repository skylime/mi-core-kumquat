#!/bin/bash
# Configure kumquat

host=$(mdata-get sdc:hostname)
cert_dir='/opt/local/etc/httpd/ssl/'

# Setup hostname for kumquat config
sed -i "s:HOSTNAME:${host}:g" /opt/local/etc/httpd/01-kumquat.conf

# SSL configuration
if mdata-get kumquat_ssl 1>/dev/null 2>&1; then
	mdata-get kumquat_ssl > ${cert_dir}kumquat.pem
else
	openssl req -newkey rsa:2048 -keyout ${cert_dir}kumquat.key \
	            -out ${cert_dir}kumquat.csr -nodes \
	            -subj "/C=DE/L=Raindbow City/O=Aperture Science/OU=Please use valid ssl certificate/CN=${host}"
	openssl x509 -in ${cert_dir}kumquat.csr -out ${cert_dir}kumquat.crt -req -signkey ${cert_dir}kumquat.key -days 128
fi
