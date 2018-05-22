# Modify proftpd configuration file
WWW_UID=$(id -u www)
WWW_GID=$(id -g www)
MYSQL_KUMQUAT=$(mdata-get mysql_kumquat_pw)

/opt/local/bin/sed -i -e "s:MYSQL_KUMQUAT:${MYSQL_KUMQUAT}:g" \
	-e "s:WWW_UID:${WWW_UID}:g" -e "s:WWW_GID:${WWW_GID}:g" \
	/opt/local/etc/proftpd.conf

# Enable proftpd service
/usr/sbin/svcadm enable svc:/pkgsrc/proftpd:default
