# Modify phpMyAdmin configuration file and kumquat menu

# Create blowfish secret for phpMyAdmin
GEN_BLOWFISH_SECRET=$(od -An -N8 -x /dev/random | head -1 | sed 's/^[ \t]*//' | tr -d ' ')
/opt/local/bin/sed -i -e "s:GEN_BLOWFISH_SECRET:${GEN_BLOWFISH_SECRET}:g" \
	/opt/local/etc/phpmyadmin/config.inc.php

# Add menu entry to default kumquat template to link to phpMyAdmin
/opt/local/bin/sed -i -e \
	's:\(.*mysql_database_list.*\):\1\n\t\t\t\t\t\t<li><a href="/phpmyadmin">phpMyAdmin</a></li>:g' \
	/opt/kumquat/templates/base.html
