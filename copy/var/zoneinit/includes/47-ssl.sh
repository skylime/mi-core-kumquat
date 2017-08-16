# This script will try to manage the ssl certificates for us. It will
# use the mdata variable if provided, if it does not exists we will
# try to get a certificate from the Let's Encrypt API.
# As fallback the self-signed certificate is used from 45-ssl-selfsigned.sh

# Default
SSL_HOME='/opt/local/etc/httpd/ssl/'

# Create folder if it doesn't exists
mkdir -p "${SSL_HOME}"

# Use user certificate if provided
if mdata-get kumquat_ssl 1>/dev/null 2>&1; then
	(
	umask 0077
	mdata-get kumquat_ssl > "${SSL_HOME}/kumquat.pem"
	# Split files for kumquat usage
	openssl pkey -in "${SSL_HOME}/kumquat.pem" -out "${SSL_HOME}/kumquat.key"
	openssl crl2pkcs7 -nocrl -certfile "${SSL_HOME}/kumquat.pem" | \
		openssl pkcs7 -print_certs -out "${SSL_HOME}/kumquat.crt"
	)
elif /opt/core/bin/ssl-letsencrypt.sh -t webroot 1>/dev/null; then
	# Try to generate let's encrypt ssl certificate for the hostname
	LE_HOME='/opt/local/etc/letsencrypt/'
	LE_LIVE="${LE_HOME}live/$(hostname)/"
	# Workaround to link correct files for SSL_HOME
	ln -sf ${LE_LIVE}/fullchain.pem ${SSL_HOME}/kumquat.crt
	ln -sf ${LE_LIVE}/privkey.pem ${SSL_HOME}/kumquat.key
	# Update renew-hook.sh
	echo '#!/usr/bin/env bash' > ${LE_HOME}renew-hook.sh
	echo 'svcadm restart svc:/pkgsrc/apache:default' >> ${LE_HOME}renew-hook.sh
	echo 'svcadm restart svc:/pkgsrc/proftpd:default' >> ${LE_HOME}renew-hook.sh
	# Remove unused self-signed if available
	rm -f ${SSL_HOME}/kumquat.csr ${SSL_HOME}/kumquat.pem
fi

# Always run a restart of the webserver
svcadm restart svc:/pkgsrc/apache:default
