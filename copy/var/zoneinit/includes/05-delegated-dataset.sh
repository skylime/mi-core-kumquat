#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data

if zfs list ${DDS} 1>/dev/null 2>&1; then
	zfs create ${DDS}/www   || true
	zfs create ${DDS}/mysql || true

	if ! zfs get -o value -H mountpoint ${DDS}/www | grep -q /var/www; then
		zfs set mountpoint=/var/www ${DDS}/www
	fi
	if ! zfs get -o value -H mountpoint ${DDS}/mysql | grep -q /var/mysql; then
		zfs set mountpoint=/var/mysql ${DDS}/mysql
	fi
fi

# Always try to set the correct permissions for /var/mysql
chown -R mariadb:mariadb /var/mysql || true

# create trash folder for removed virtual hosts
mkdir -p /var/www/.Trash
