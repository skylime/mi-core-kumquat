#!/usr/bin/env bash
# Create extra user webmaster with the same uid and gid of the existing www user
# to support ssh login. Use useradm-zfs from core-base to handle user creation
# with a delegate dataset and softfail if it exists.

# Create user
/opt/core/bin/useradd-zfs -m -o \
	-u $(id -u www) -g $(id -g www) \
	-s /usr/bin/bash \
	webmaster

# Receive mdata information for ssh public key in .ssh/authorized_keys
if mdata-get webmaster_authorized_keys 1>/dev/null 2>&1; then
	home='/home/webmaster'
	mkdir -p ${home}/.ssh
	echo "# This file is managed by mdata-get webmaster_authorized_keys" \
		> ${home}/.ssh/authorized_keys
	mdata-get webmaster_authorized_keys >> ${home}/.ssh/authorized_keys
	chmod 700 ${home}/.ssh
	chmod 644 ${home}/.ssh/authorized_keys
	chown webmaster:www ${home}/.ssh/authorized_keys
fi
