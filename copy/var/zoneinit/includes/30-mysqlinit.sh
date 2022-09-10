# MySQL my.cnf creation/tuning
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

log "create tuned g/MySQL configuration"
cat > /opt/local/etc/my.cnf <<EOF

# The MySQL server
[mysqld]
bind-address = 127.0.0.1
skip_external_locking
skip_name_resolve

# InnoDB settings
innodb_data_home_dir = /var/mysql
innodb_log_group_home_dir = /var/mysql
innodb_data_file_path = ibdata1:100M:autoextend
innodb_buffer_pool_size = ${INNODB_BUFFER_POOL_SIZE}
innodb_log_file_size = 400M
innodb_flush_log_at_trx_commit = 2
innodb_lock_wait_timeout = 50
innodb_file_per_table
innodb_doublewrite = 0
innodb_io_capacity = 1500
innodb_read_io_threads = 8
innodb_write_io_threads = 8

# Slow query log settings
# The default logs all full table scans,tmp tables,filesorts on disk queries
#use_global_long_query_time = 1
#long_query_time = 0.5
slow_query_log_file = /var/log/mariadb/slowquery.log
slow_query_log = 1
log_slow_filter = "full_scan,tmp_table_on_disk,filesort_on_disk"
log_slow_verbosity = "query_plan"

# Other general MySQL settings
thread_cache_size = ${THREAD_CACHE_SIZE}
query_cache_size = 16M
query_cache_strip_comments
query_cache_type = 1
back_log = ${BACK_LOG}
tmpdir = /var/tmp
max_connections = ${MAX_CONNECTIONS}
max_allowed_packet = 24M
thread_stack = 256K
tmp_table_size = 64M
max_heap_table_size = 64M

log-error = /var/log/mariadb/error.log

[mysqldump]
quick
max_allowed_packet = 16M

[mysql]
no-auto-rehash
EOF

if [ ! -d /var/mysql/mysql ]; then
         mariadb-install-db --datadir=/var/mysql --skip-name-resolve --skip-test-db --user=mariadb
fi
