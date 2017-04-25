# Get password from metadata, unless passed as MYSQL_PW, or set one.
log "getting mysql_pw"
MYSQL_PW=${MYSQL_PW:-$(mdata-get mysql_pw 2>/dev/null)} || \
MYSQL_PW=$(od -An -N8 -x /dev/random | head -1 | tr -d ' ');

# Be sure the generated MYSQL_PW password set also as mdata
# information.
mdata-put mysql_pw "${MYSQL_PW}"

# Default query to lock down access and clean up
MYSQL_INIT="DELETE from mysql.user WHERE User = 'root';
DELETE FROM mysql.proxies_priv WHERE Host='base.joyent.us';
GRANT ALL on *.* to 'root'@'localhost' identified by '${MYSQL_PW}' with grant option;
GRANT ALL on *.* to 'root'@'${PRIVATE_IP:-${PUBLIC_IP}}' identified by '${MYSQL_PW}' with grant option;
GRANT LOCK TABLES,SELECT,RELOAD,SUPER,REPLICATION CLIENT on *.* to '${QB_US}'@'localhost' identified by '${QB_PW}';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
install plugin sphinx soname 'ha_sphinx.so';"

# MySQL my.cnf tuning
MEMCAP=$(kstat -c zone_memory_cap -s physcap -p | cut -f2 | awk '{ printf "%d", $1/1024/1024/3 }');

# innodb_buffer_pool_size
INNODB_BUFFER_POOL_SIZE=$(echo -e "scale=0; ${MEMCAP}/2"|bc)M

# back_log
BACK_LOG=64
[[ ${MEMCAP} -gt 8000 ]] && BACK_LOG=128

# max_connections
[[ ${MEMCAP} -lt 1000 ]] && MAX_CONNECTIONS=200
[[ ${MEMCAP} -gt 1000 ]] && MAX_CONNECTIONS=500
[[ ${MEMCAP} -gt 2000 ]] && MAX_CONNECTIONS=1000
[[ ${MEMCAP} -gt 3000 ]] && MAX_CONNECTIONS=2000
[[ ${MEMCAP} -gt 5000 ]] && MAX_CONNECTIONS=5000

# thread_cache_size
THREAD_CACHE_SIZE=$((${MAX_CONNECTIONS}/2))
[[ ${THREAD_CACHE_SIZE} -gt 1000 ]] && THREAD_CACHE_SIZE=1000

log "tuning MySQL configuration"
gsed -i \
	-e "s/back_log = [0-9]*/back_log = ${BACK_LOG}/" \
	-e "s/thread_cache_size = [0-9]*/thread_cache_size = ${THREAD_CACHE_SIZE}/" \
	-e "s/max_connections = [0-9]*/max_connections = ${MAX_CONNECTIONS}/" \
	-e "s/innodb_buffer_pool_size = [0-9]*M/innodb_buffer_pool_size = ${INNODB_BUFFER_POOL_SIZE}/" \
	-e "s/#query_cache_size = 16M/query_cache_size = 16M/" \
	-e "s/#query_cache_strip_comments/query_cache_strip_comments/" \
	-e "s/query_cache_type = 0/query_cache_type = 1/" \
	/opt/local/etc/my.cnf

log "shutting down an existing instance of MySQL"
if [[ "$(svcs -Ho state percona)" == "online" ]]; then
	svcadm disable -t percona
	sleep 2
fi

log "starting the new MySQL instance"
svcadm enable percona

log "waiting for the socket to show up"
COUNT="0";
while [[ ! -e /tmp/mysql.sock ]]; do
        sleep 1
        ((COUNT=COUNT+1))
        if [[ $COUNT -eq 60 ]]; then
          log "ERROR Could not talk to MySQL after 60 seconds"
    ERROR=yes
    break 1
  fi
done
[[ -n "${ERROR}" ]] && exit 31
log "(it took ${COUNT} seconds to start properly)"

sleep 1

[[ "$(svcs -Ho state percona)" == "online" ]] || \
  ( log "ERROR MySQL SMF not reporting as 'online'" && exit 31 )

# If you can login without a password you could create a valid user
if mysqladmin -u root processlist &>/dev/null; then
	log "running the access lockdown SQL query"
	mysql -u root -e "${MYSQL_INIT}" >/dev/null || \
	  ( log "ERROR MySQL query failed to execute." && exit 31 )
fi

# Create username and password file for root user
log "create my.cnf for root user"
cat > /root/.my.cnf <<EOF
[client]
host = localhost
user = root
password = ${MYSQL_PW}
EOF
