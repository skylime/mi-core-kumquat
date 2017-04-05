# To be sure we've SSL enabled by default we will create a self-signed
# certificate as fallback. This will allow us to enable nginx or any
# webserver.

# Default
SSL_HOME='/opt/local/etc/httpd/ssl/'

# Create folder if it doesn't exists
mkdir -p "${SSL_HOME}"

# Self-signed certificate generator
/opt/core/bin/ssl-selfsigned.sh -d ${SSL_HOME} -f kumquat
