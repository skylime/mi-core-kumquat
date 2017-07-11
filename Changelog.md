# Changelog

## 17.1.2

### Fix

- Missing / for kumquat redirect. [Thomas Merkel]

## 17.1.1

### Fix

- Redirect Kumquat admin interface to HTTPS. [Thomas Merkel]
- Fix SSL certificate (if we use Let's Encrypt) for ProFTPd. [Thomas
  Merkel]

### Change

- verify if zfs mountpoint is already configured
- switch snapshot config to 2day=>8hour,14day=>1day,1year=>1month,10year=>1year
- use znapzend only if delegate dataset is used

## 17.1.0

### New

* Update to core-base 17.1.0 release. [Thomas Merkel]
* Update packages for 2017Q1. [Thomas Merkel]

### Fix

* We should keep the acme-challenge folder also if certbot is running. [Thomas Merkel]
* Fix kumquat_admin_email. [Thomas Merkel]

## 16.4.3

### New

* Kumquat version bump which supports IDN Subdomains. [Thomas Merkel]
* Provide Let&#x27;s Encrypt support for Kumquat admin UI. [Thomas Merkel]
* New mdata-variable kumquat_admin_email. [Thomas Merkel]

  The new option allow you to configure an admin email address for the kumquat user and the return path for PHP sendmail usage.

### Fix

* Fix percona version and update to core-base. [Thomas Merkel]
* Switching to default table_open_cache. [Thomas Merkel]

  https://mariadb.com/kb/en/mariadb/optimizing-table_open_cache/

## 16.4.2

### New

* Enable opcache by default. [Thomas Merkel]
* Enable Apache usdt by default for dtrace usage. [Thomas Merkel]

### Other

* Update to newest core-base image. [Thomas Merkel]
* Use pip version 3.5. [Thomas Merkel]

## 16.4.1

### New

* Update to newest kumquat version which includes python3 support. [Thomas Merkel]
* Remove nginx and use only apache as default webserver. [Thomas Merkel]

### Other

* Fix additional python issues with Kumquat. [Thomas Merkel]
* Add py35-future and switch to newest core-base release. [Thomas Merkel]
* Use py35-percona56client as mysql connector for kumquat and django. [Thomas Merkel]
* Php extensions are loaded automatically via pkg install. [Thomas Merkel]

## 16.2.0

### New

* Enable Apache deflate module by default. [Thomas Merkel]

### Fix

* Remove quickbackup-percona because of high memory usage. [Thomas Merkel]

  xtrabackup / quickbackup requires to much memory and kill most of the zones which only have 1-2GB of memory. Because we use zfs snapshots we don&#x27;t create extra MySQL / Percona dumps.

* Fix, freeze Django and ZeroRPC version. [Thomas Merkel]
* Fix usage of percona 5.6.x. [Thomas Merkel]

### Other

* Version bump to 16.2 core-base. [Thomas Merkel]
* Updated Let&#x27;s Encrypt TOS. [Thomas Merkel]

## 16.1.1

### Fix

* Modify dz to update and upgrade all installed packages to the newest Q-Release. [Thomas Merkel]
* Provide new Kumquat version with SSL CA fix for Let&#x27;s Encrypt. [Thomas Merkel]

## 16.1.0

### New

* Version update to new core-base version. [Thomas Merkel]

  * Kumquat Let&#x27;s Encrypt support
  * Kumquat ServerAlias support
  * Kumquat Error Log in user interface
  * Kumquat Bugfix for FTP accounts

### Fix

* Fix issue with wrong umask and broken pkgsrc packages. [Thomas Merkel]

  * remove xtrabackup
  * fix umask for acme token
  * fix alias for acme token path

* Fix user permissions for letsencrypt user. [Thomas Merkel]
* Provide path to error logs of vhosts to Kumquat. [Thomas Merkel]

## 15.4.0

### New

* Enable percona query cache by default. [Thomas Merkel]
* Kumquat version bump with migration fix. [Thomas Merkel]

  Version bump of mi-core-base to 15.4.0 release. Include notification fixes and Kumquat (django) fix for migrations.

### Fix

* Kumquat version bump and proftpd from pkgsrc. [Thomas Merkel]

  Kumquat fix for ftp accounts without vhost and installation of proftpd via pkgsrc


## 15.3.1

### New

* Version bump to kumquat v0.1.27 [Thomas Merkel]
* Provide nginx with microcache feature [Thomas Merkel]

### Fix

* Problem with Munin-Plugins not installed automatically. [Thomas Merkel]

  Because of the wrong quote for the plugins they are not automatically
  installed on the systems. After removing the inverted comma the script
  install them.

* Issue with backend service on MySQL reconnect [Thomas Merkel]

### Other

* Be sure kumquat services run after setup. [Thomas Merkel]
* Update kumquat settings.py to support django 1.8. [Thomas Merkel]
* Enable nginx by default. [Thomas Merkel]
* Auto for worker_processes. [Thomas Merkel]
* Require %a for logging the correct ip address. [Thomas Merkel]
* Update permissions for cache dir. [Thomas Merkel]
* Set nginx cache dir to /var/cache/nginx. [Thomas Merkel]
* Enabled config for mod_remoteip. [Thomas Merkel]
* Enable remoteIP for httpd. [Thomas Merkel]
* Provide nginx config for microcache. [Thomas Merkel]
* Listen only on localhost for port 80 via apache. [Thomas Merkel]
* Install nginx by default. [Thomas Merkel]
* Create and use extra ssl folder for kumquat service. [Thomas Merkel]
* Add php-ftp package and enable it via php.ini. [Thomas Merkel]


## 15.3.0

### New

* Version upgrade to 15.3.0 includes the new Kumquat version. [Thomas Merkel]

	Support new Kumquat version with features like cronjobs, zfs snapshots, etc.
		Install proftpd from SkyLime with extra module support for percona
		Remove unused nginx from release
		Create missing Trash folder for old backups from Kumquat

* Use default apache from pkgsrc. [Thomas Merkel]

### Fix

* Percona backup scripts. [Thomas Merkel]
* Fix smf. [Thomas Merkel]
* Fix missing settings. [Thomas Merkel]
* Fix issue with manifest. [Thomas Merkel]

### Other

* Add new ProFTPd modules to configuration file. [Thomas Merkel]
* Cleanup package list and add cron job for kumquat. [Thomas Merkel]
* Cleanup customize script to support new core-base image. [Thomas Merkel]
* Update license file for SkyLime GmbH. [Thomas Merkel]
* Create snapshots for data and databases automatically. [Thomas Merkel]
* Update to new PHP version 5.6 and add package for znapzend. [Thomas Merkel]
* Make ssl more secure as default. [Thomas Merkel]
* Make shit more secure, for example the backend socket. [Thomas Merkel]
* Add py27-msgpack. [Thomas Merkel]
* Add missing deps for zeromq and gevent. [Thomas Merkel]
* Use command hostname and not mdata-get sdc:hostname, because it&#x27;s sometimes not set and than apache will not work. [Thomas Merkel]

## 14.2.12

### Other

* version update of mibe image. [Thomas Merkel]
* Workaround for zerorpc. [Thomas Merkel]
* fix issue with manifest. [Thomas Merkel]
* well we need the user first. [Thomas Merkel]
* make shit more secure, for example the backend socket. [Thomas Merkel]
* fix smf. [Thomas Merkel]
* fix missing settings. [Thomas Merkel]
* add py27-msgpack. [Thomas Merkel]
* add missing deps for zeromq and gevent. [Thomas Merkel]
* Add ZFS snapshot support to Kumquat, includes new background service. [Thomas Merkel]
* use command hostname and not mdata-get sdc:hostname, because it's sometimes not set and than apache will not work. [Thomas Merkel]

## 14.2.11

### New

* version bump. [Thomas Merkel]
* add requirements for django-settings-export. [Thomas Merkel]
* Modify kumquat config for external URLs. [Thomas Merkel]
* Update readme with new mdata information for whitelist, phpMyAdmin URL and Webmail URL. [Thomas Merkel]
* Don't use this script to set URL for phpMyAdmin because we've mdata information now. [Thomas Merkel]
* Add `core_mail_whitelist` as mdata information. [Thomas Merkel]
* Add new kumquat settings.py file from the origin. We need to find a other solution in the future to overwrite config files. [Thomas Merkel]
* Update to new kumquat version 0.1.22. [Thomas Merkel]

### Fix

* Fix quick-backup loosing password on reprovision. [Thomas Merkel]

    We will save the password in mdata variable for the future, but we
    still need to set it by reprovision.

## 14.2.10

### Other

* minimal fix for wrong bool default value in django. [Thomas Merkel]

## 14.2.9

### Other

* Version upgrade to new kumquat. Includes patches for subaddress extension.
  [Thomas Merkel]
* Allow file permission modification by ftp user. [Thomas Merkel]
* Enable php55-zip package for PHP. [Thomas Merkel]

## 14.2.8

### New

* add nginx to use it for microcaching and ssl. [Thomas Merkel]
* add some basic mysql checks we would like to have. [Thomas Merkel]
* allow munin to query mysql for statistics. [Thomas Merkel]
* add proftpd munin monitoring. [Thomas Merkel]
* use logadm for proftpd logfile. [Thomas Merkel]
* create logfiles for proftpd. [Thomas Merkel]
* add more munin plugins for apache monitoring. [Thomas Merkel]

### Changes

* add more proftpd scripts for monitoring. [Thomas Merkel]
* add listen for status page for munin. [Thomas Merkel]

### Fix

* have a working and running quickbackup-percona. [Thomas Merkel]

    Only setup quickbackup with username and password once. We should also
    enable the backup by default.

* we require percona56-xtrabackup for doing backups. [Thomas Merkel]
* open phpMyAdmin in new tab. [Thomas Merkel]
* remove old apache configs for image. [Thomas Merkel]

### Other

* new version update and base image. [Thomas Merkel]
* use upgrade with pkg_add. [Thomas Merkel]
* Force our apache version to be installed (because of an SSL memoryleek fix) [Thomas Merkel]
* respawn threads to combat memory leaks. [Sebastian Wiedenroth]

## 14.2.7

### New

* version update. [Thomas Merkel]

### Fix

* fix ftp.path for all users. [Thomas Merkel]

### Other

* bump kumquat version, includes fix for catch-all domains. [Sebastian Wiedenroth]

## 14.2.6 (2014-10-02)

### New

* update to new core-base image 5f32cd38-4a1f-11e4-82e4-632b59542bc6. [Thomas Merkel]

### Changes

* increase memory limit. [Thomas Merkel]

### Fix

* proftpd ssl certificate chain and ssl problems on different clients. [Thomas Merkel]

## 14.2.5 (2014-09-29)

### New

* new kumquat version. [Thomas Merkel]
* Allow global FTP users without any vhost configured. [Thomas Merkel]

### Other

* Merge branch 'master' of github.com:skylime/mi-core-kumquat. [Thomas Merkel]

## 14.2.4 (2014-09-27)

### New

* update to new core-base image 43aaede4-4622-11e4-a839-d3704910e498. [Thomas Merkel]

## 14.2.3 (2014-09-26)

### Other

* update changelog. [Thomas Merkel]
* update kumquat version. [Thomas Merkel]
* allow static files. [Thomas Merkel]
* add php dom. [Thomas Merkel]
* update to new kumquat version. [Thomas Merkel]

## 14.2.2 (2014-09-25)

### Other

* changelog update. [Thomas Merkel]
* version update. [Thomas Merkel]
* php values for upload. [Thomas Merkel]
* less memory for mysql. [Thomas Merkel]

## 14.2.1 (2014-09-25)

### Other

* add Changelog. [Thomas Merkel]
* update to new core-base image: a6fb1ff0-4333-11e4-a0e1-370c81688134. [Thomas Merkel]
* remove logfile handler. [Thomas Merkel]
* import sys is missing. [Thomas Merkel]
* fix comma typo. [Thomas Merkel]
* Listen on udp port 514 on localhost for syslog logging from django application. [Thomas Merkel]
* fix typo for access to phpmyadmin. [Thomas Merkel]
* slash is missing at the end. [Thomas Merkel]
* version update for kumquat. [Thomas Merkel]
* Add extra phpMyAdmin kumquat menu entry and allow phpMyAdmin special allow rules via apache. [Thomas Merkel]
* add phpMyAdmin link to kumquat template. [Thomas Merkel]
* version update to v0.1.10. [Thomas Merkel]
* version update to v0.1.9. [Thomas Merkel]
* update to new core-base image: 6babbf24-3765-11e4-a87a-23e846a65e81. [Thomas Merkel]
* Disable PHP error and log to extra file. [Thomas Merkel]
* update to new core-base image: 99c9e7ac-34ed-11e4-bdc4-236f63b1ea9d. [Thomas Merkel]
* update readme file. [Thomas Merkel]
* update to new core-base image: 89402478-34cf-11e4-ac94-f3a4d047918f. [Thomas Merkel]
* update to new core-base image: aed27f7a-34c4-11e4-be6c-4392ae5601bc. [Thomas Merkel]
* update to new core-base image: 5f749f3c-335f-11e4-a952-e780d226fa57. [Thomas Merkel]
* update to new core-base image: fbd244a6-32bf-11e4-8629-73c3e6ed202d. [Thomas Merkel]
* add missing requirements for django-messagegroups. [Thomas Merkel]
* update to new core-base image: 86465fe4-312d-11e4-a145-57554f40fa40. [Thomas Merkel]
* update base image. [Thomas Merkel]
* add missing req. in settings. [Thomas Merkel]
* run vhost create once on zoneinit. [Thomas Merkel]
* fix mysql user creation if failed. [Thomas Merkel]
* be sure mysql and user creation run only once. [Thomas Merkel]
* allow mysql var updates. [Thomas Merkel]
* upgrade to version 0.1.8. [Thomas Merkel]
* use less memory for everything. [Thomas Merkel]
* bind on localhost is good. [Thomas Merkel]
* only remove root user and add it new. [Thomas Merkel]
* support localhost and not ip. [Thomas Merkel]
* add readme with some basic information. [Thomas Merkel]
* generate phpmyadmin config file. [Thomas Merkel]
* remove phpmyadmin setup folder. [Thomas Merkel]
* scripts replaced by lib. [Thomas Merkel]
* only allow phpmyadmin from https vhost. [Thomas Merkel]
* version update. [Thomas Merkel]
* add more index files. [Thomas Merkel]
* fix settings for kumquat and token. [Thomas Merkel]
* fix settings for kumquat and token. [Thomas Merkel]
* version update. [Thomas Merkel]
* add cronjob. [Thomas Merkel]
* fix sql qry for proftpd. [Thomas Merkel]
* version update and fix proftpd config. [Thomas Merkel]
* set admin pwd. [Thomas Merkel]
* remove proftpd as default pkg. [Thomas Merkel]
* version update. [Thomas Merkel]
* Add proftpd including configuration. [Thomas Merkel]
* IDs are required for UID and GID. [Thomas Merkel]
* add proftpd with mysqld support. [Thomas Merkel]
* release update. [Thomas Merkel]
* fix typo. [Thomas Merkel]
* sync mysql data and create user. [Thomas Merkel]
* version update. [Thomas Merkel]
* add allow hosts for django app. [Thomas Merkel]
* add SSL detection for proxy setting. [Thomas Merkel]
* add kumquat default settings and create secret key. [Thomas Merkel]
* add missing slash for httpd, and be sure script run only once. [Thomas Merkel]
* fix kumquat init. [Thomas Merkel]
* update to new base image. [Thomas Merkel]
* found problem with percona pkg. [Thomas Merkel]
* failed? [Thomas Merkel]
* not sure if thats the bug. [Thomas Merkel]
* fix adding pkg. [Thomas Merkel]
* force pymysqldb installation. [Thomas Merkel]
* replace uwsgi with gunicorn. [Thomas Merkel]
* fix uwsgi manifest. [Thomas Merkel]
* add kumquat install script (not finished) [Thomas Merkel]
* rename uwsgi file. [Thomas Merkel]
* only init if mysqldb not exists. [Thomas Merkel]
* fix httpd config. [Thomas Merkel]
* add py27-expat. [Thomas Merkel]
* fix index html file and hostname. [Thomas Merkel]
* fix ssl pem. [Thomas Merkel]
* add missing module. [Thomas Merkel]
* fix document root options. [Thomas Merkel]
* be sure you set mdata-put for MySQL root password. [Thomas Merkel]
* add /opt/local/bin/mysql_install_db. [Thomas Merkel]
* switch base id. [Thomas Merkel]
* add quickbackup-percona. [Thomas Merkel]
* fix path to ssl. [Thomas Merkel]
* fix typo for ssl cert generation. [Thomas Merkel]
* fix removeing files. [Thomas Merkel]
* fix uwsgi path because we would like to use 2.7. [Thomas Merkel]
* add ssl folder. [Thomas Merkel]
* damn html wget download. [Thomas Merkel]
* add uwsgi config file. [Thomas Merkel]
* remove bullshit. [Thomas Merkel]
* add uwsgi and ssl stuff. [Thomas Merkel]
* add pip as default pkg. [Thomas Merkel]
* add kumquat hostname config. [Thomas Merkel]
* enable ssl. [Thomas Merkel]
* add fpm config. [Thomas Merkel]
* add default vhost. [Thomas Merkel]
* add percona mysql config. [Thomas Merkel]
* fix include. [Thomas Merkel]
* folder already exists. [Thomas Merkel]
* change rm command. [Thomas Merkel]
* add delegated setup. [Thomas Merkel]
* remove unused httpd config files. [Thomas Merkel]
* add minimal httpd config. [Thomas Merkel]
* add our new awesome apache config file. [Thomas Merkel]
* add download for kumquat. [Thomas Merkel]
* this file is already in the base image. [Thomas Merkel]
* enable some services, cleanup customize, add py27-uwsgi and use 2014q2. [Sebastian Wiedenroth]
* add mdata-setup script. [Thomas Merkel]
* add default php extenstions and setup timezone. [Thomas Merkel]
* add default customize tasks. [Thomas Merkel]
* Add default files that are required to build mibe. [Thomas Merkel]

