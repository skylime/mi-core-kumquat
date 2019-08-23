if [ ! -d /var/mysql/mysql ]; then
	/opt/local/sbin/mysqld --initialize-insecure --user=mysql
fi
