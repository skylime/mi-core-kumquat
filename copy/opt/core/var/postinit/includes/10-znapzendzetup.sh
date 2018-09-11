UUID=$(mdata-get sdc:uuid)
DDS=zones/${UUID}/data

log "check delegate dataset ${DDS}"

if zfs list ${DDS} 1>/dev/null 2>&1; then
        log "znapzend for backup"
        znapzendzetup create --recursive --tsformat='%Y-%m-%d-%H%M%S' --donotask \
                SRC '2day=>8hour,14day=>1day,1year=>1month,10year=>1year' ${DDS}

        /usr/sbin/svcadm enable svc:/pkgsrc/znapzend:default
fi
