#!/usr/bin/env bash
# This script checks for an recommended MySQL upgrade and update the /etc/motd
# with some user information.

if [ -f /var/mysql/mysql_upgrade_info ]; then
	# mysql_upgrade_info exists, so version check is required
	mysql_select_version=$(mysql -e 'select version();' --skip-column-names)
	running_version=${mysql_select_version%-*}
	upgrade_info_version=$(cat /var/mysql/mysql_upgrade_info)
	if [[ "${running_version}" == "${upgrade_info_version}" ]]; then
		# Running version and upgrade information are the same. No
		# uprade required.
		exit 0
	fi
fi

# mysql_upgrade_info doesn't exists or upgrade information are different to
# local running version. Information added to /etc/motd
cp /etc/motd /etc/motd.clean
cat >> /etc/motd <<-EOF
 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 ┃ Operation task recommended:                                        ┃
 ┃    $ mysql_upgrade && svcadm restart svc:/pkgsrc/percona:default   ┃
 ┃    $ motd-cleanup                                                  ┃
 ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
EOF
