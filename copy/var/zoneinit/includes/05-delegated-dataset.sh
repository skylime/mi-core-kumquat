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

	# znapzend for backup
	znapzendzetup create --recursive --tsformat='%Y-%m-%d-%H%M%S' --donotask \
		SRC '2day=>8hour,14day=>1day,1year=>1month,10year=>1year' ${DDS}

	/usr/sbin/svcadm enable svc:/pkgsrc/znapzend:default
fi

# create trash folder for removed virtual hosts
mkdir -p /var/www/.Trash
