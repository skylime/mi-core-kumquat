# Modify proftpd configuration file
WWW_UID=$(id -u www)
WWW_GID=$(id -g www)
MYSQL_KUMQUAT=$(mdata-get mysql_kumquat_pw)

/opt/local/bin/sed -i -e "s:MYSQL_KUMQUAT:${MYSQL_KUMQUAT}:g" \
	-e "s:WWW_UID:${WWW_UID}:g" -e "s:WWW_GID:${WWW_GID}:g" \
	/opt/local/etc/proftpd.conf

# Use logadm for rotate the logfiles
logadm -w /var/log/proftpd/proftpd.log -p 1d -C 10 -N -m 640 -c
logadm -w /var/log/proftpd/xferlog -p 1d -C 10 -N -m 640 -c

# Enable proftpd service
/usr/sbin/svcadm enable svc:/pkgsrc/proftpd:default
