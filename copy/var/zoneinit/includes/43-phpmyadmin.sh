# Modify phpMyAdmin configuration file

GEN_BLOWFISH_SECRET=$(od -An -N8 -x /dev/random | head -1 | sed 's/^[ \t]*//' | tr -d ' ')

/opt/local/bin/sed -i -e "s:GEN_BLOWFISH_SECRET:${GEN_BLOWFISH_SECRET}:g" \
	/opt/local/etc/phpmyadmin/config.inc.php
