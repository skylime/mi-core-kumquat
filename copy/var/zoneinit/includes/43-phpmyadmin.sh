# Modify phpMyAdmin configuration file and kumquat menu

# Create blowfish secret for phpMyAdmin
GEN_BLOWFISH_SECRET=$(od -An -N64 -x /dev/random | head -1 | sed 's/^[ \t]*//' | tr -d ' ')
/opt/local/bin/sed -i -e "s:GEN_BLOWFISH_SECRET:${GEN_BLOWFISH_SECRET}:g" \
	/opt/local/etc/phpmyadmin/config.inc.php

# Special configuration that allow you extra security for phpMyAdmin
if mdata-get phpmyadmin_allow 1>/dev/null 2>&1; then
	# Only allow from host or ips you configure
	/opt/local/bin/sed -i -e "s:PHPMYADMIN_ALLOW_FROM:$(mdata-get phpmyadmin_allow):g" \
		/opt/local/etc/httpd/vhosts/01-kumquat.conf
else
	# Default allow from all and add menu entry
	/opt/local/bin/sed -i -e 's:PHPMYADMIN_ALLOW_FROM:all:g' \
		/opt/local/etc/httpd/vhosts/01-kumquat.conf
fi
