start=`date +%s`

/usr/sbin/svcadm enable svc:/pkgsrc/percona:default

end=`date +%s`
log "debug (sec): $((end-start))"
