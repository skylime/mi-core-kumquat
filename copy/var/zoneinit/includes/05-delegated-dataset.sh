#!/bin/bash
UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data

if zfs list ${DDS} 1>/dev/null 2>&1; then
	zfs create ${DDS}/www   || true
	zfs create ${DDS}/mysql || true

	zfs set mountpoint=/var/www ${DDS}/www
	zfs set mountpoint=/var/mysql ${DDS}/mysql
fi
