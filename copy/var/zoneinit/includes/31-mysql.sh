# Get password from metadata, unless passed as MYSQL_PW, or set one.
log "getting mysql_pw"
MYSQL_PW=${MYSQL_PW:-$(mdata-get mysql_pw 2>/dev/null)} || \
MYSQL_PW=$(od -An -N8 -x /dev/random | head -1 | tr -d ' ');

# Be sure the generated MYSQL_PW password set also as mdata
# information.
mdata-put mysql_pw "${MYSQL_PW}"

# Default query to lock down access and clean up
MYSQL_INIT="DELETE from mysql.user WHERE User = 'root';
FLUSH PRIVILEGES;
CREATE USER 'root'@'localhost' identified by '${MYSQL_PW}';
CREATE USER 'root'@'${PRIVATE_IP:-${PUBLIC_IP}}' identified by '${MYSQL_PW}';
GRANT ALL on *.* to 'root'@'localhost' identified by '${MYSQL_PW}' with grant option;
GRANT ALL on *.* to 'root'@'${PRIVATE_IP:-${PUBLIC_IP}}' identified by '${MYSQL_PW}' with grant option;
FLUSH PRIVILEGES;"

log "shutting down an existing instance of MySQL"
if [[ "$(svcs -Ho state mariadb)" == "online" ]]; then
	svcadm disable -t mariadb
	sleep 2
fi

log "starting the new MySQL instance"
svcadm enable mariadb

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

[[ "$(svcs -Ho state mariadb)" == "online" ]] || \
  ( log "ERROR MySQL SMF not reporting as 'online'" && exit 31 )

# If you can login without a password you could create a valid user
if mysqladmin -u root processlist &>/dev/null; then
	log "import local timezones to SQL server"
	mysql_tzinfo_to_sql /usr/share/lib/zoneinfo | mysql mysql
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
