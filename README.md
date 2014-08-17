# mi-core-kumquat

Please refer to https://github.com/joyent/mibe for use of this repo.

## description

This is a standalone webservice / webhosting template. It provides you with
[kumquat](https://github.com/wiedi/kumquat), an awesome minimal web interface to
manage domains, vhosts, mysql and ftp accounts.

Please note that it requires
[mi-core-base](https://github.com/skylime/mi-core-base).

It install php-fpm with apache, proftpd and for kumquat gunicorn. Percona is
installed for a local mysql server.

## mdata variables

No mdata variable is required. Everything could be automatically generated on
provision state. We recommend a valid `kumquat_ssl` certificate.

- `kumquat_ssl`: ssl certificate for kumquat web interface
- `kumquat_admin`: admin password for kumquat interface
- `core_mail_token`: mail export token from kumquat
- `mysql_pw`: mysql root password
- `mysql_kumquat_pw`: kumquat mysql password

## services

- `21/tcp`: ftp with tls
- `22/tcp`: ssh connections
- `80/tcp`: http webserver
- `443/tcp`: https webserver
