#!/bin/bash
# Create extra plugin information for mysql_ munin scripts
start=`date +%s`

cat >> /opt/local/etc/munin/plugin-conf.d/mysql <<EOF
[mysql_*]
user root
env.mysqladmin /opt/local/bin/mysqladmin
env.mysqlopts --defaults-extra-file=/root/.my.cnf
EOF

end=`date +%s`
log "debug (sec): $((end-start))"
