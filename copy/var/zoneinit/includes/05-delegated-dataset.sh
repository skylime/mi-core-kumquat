#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data

if zfs list ${DDS} 1>/dev/null 2>&1; then
	zfs create ${DDS}/www   || true
	zfs create ${DDS}/mysql || true

	zfs set mountpoint=/var/www ${DDS}/www
	zfs set mountpoint=/var/mysql ${DDS}/mysql
fi

# znapzend for backup
znapzendzetup create --recursive --tsformat='%Y-%m-%d-%H%M%S' --donotask \
	SRC '7day=>8hour,30day=>1day,1year=>1week,10year=>1month' ${DDS}/www
znapzendzetup create --recursive --tsformat='%Y-%m-%d-%H%M%S' --donotask \
	SRC '7day=>8hour,30day=>1day,1year=>1week,10year=>1month' ${DDS}/mysql
/usr/sbin/svcadm enable svc:/pkgsrc/znapzend:default
