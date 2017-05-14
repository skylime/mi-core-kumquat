#!/bin/bash
start=`date +%s`

UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data

if zfs list ${DDS} 1>/dev/null 2>&1; then

	start_other=`date +%s`
	zfs create ${DDS}/www   || true
	zfs create ${DDS}/mysql || true
	end_other=`date +%s`
	log "debug zfs create (sec): $((end_other-start_other))"

	start_other=`date +%s`
	if ! zfs get -o value -H mountpoint ${DDS}/www | grep -q /var/www; then
		zfs set mountpoint=/var/www ${DDS}/www
	fi
	if ! zfs get -o value -H mountpoint ${DDS}/mysql | grep -q /var/mysql; then
		zfs set mountpoint=/var/mysql ${DDS}/mysql
	fi
	end_other=`date +%s`
	log "debug zfs mountpoint (sec): $((end_other-start_other))"

	# znapzend for backup
	# verify if exists or not
	start_other=`date +%s`
	if ! znapzendzetup list ${DDS}/www 2>/dev/null | grep -q ${DDS}/www; then
		log "run znapzendzetup www"
		znapzendzetup create --recursive --tsformat='%Y-%m-%d-%H%M%S' --donotask \
			SRC '7day=>8hour,30day=>1day,1year=>1week,10year=>1month' ${DDS}/www
	fi
	if ! znapzendzetup list ${DDS}/mysql 2>/dev/null | grep -q ${DDS}/mysql; then
		log "run znapzendzetup mysql"
		znapzendzetup create --recursive --tsformat='%Y-%m-%d-%H%M%S' --donotask \
			SRC '7day=>8hour,30day=>1day,1year=>1week,10year=>1month' ${DDS}/mysql
	fi
	end_other=`date +%s`
	log "debug znapzendzetup (sec): $((end_other-start_other))"

	start_other=`date +%s`
	/usr/sbin/svcadm enable svc:/pkgsrc/znapzend:default
	end_other=`date +%s`
	log "debug (sec): $((end_other-start_other))"
fi

# create trash folder for removed virtual hosts
mkdir -p /var/www/.Trash

end=`date +%s`
log "debug (sec): $((end-start))"
