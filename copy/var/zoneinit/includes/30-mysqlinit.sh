start=`date +%s`

if [ ! -d /var/mysql/mysql ]; then
	/opt/local/bin/mysql_install_db
fi

end=`date +%s`
log "debug (sec): $((end-start))"
