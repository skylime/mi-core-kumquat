# Example Usage

This short documentation should help you to use the existing images created and
provided by [Skylime](https://www.skylime.net). The images are synced and
published also on [Datasets.at](http://datasets.at).

## Creating

In your global-zone you should import the latest availble **core-kumquat**
image from [Datasets.at](http://datasets.at). For that reason, be sure you've
added the mirror.

```
[gz] $ imgadm sources -a http://datasets.at/
[gz] $ imgadm update
```

Import the latest image by using the image uuid. You can use `imgadm avail` or
the web interface to find the latest version.

```
# This uuid is our 20.1.2 release. Please always check for the latest version
# which includes a lot of fixes and features.
[gz] $ imgadm import 2725736b-4b37-4891-b1e2-cd1d56695e49
```

To configure and install the zone use `vmadm` and the below template. The
following variables are required to provide a full function version of
**core-kumquat**:

- `hostname` must be a fully qualified domain name

Every other option provided in the
[README.md](https://github.com/skylime/mi-core-kumquat/blob/master/README.md)
is optional and can be set as `customer_metadata`.

Example `kumquat.json`, everything with `@VARIABLE@` should be replaced:

```json
{
  "brand": "joyent",
  "image_uuid": "@UUID@",
  "alias": "@FQDN@",
  "hostname": "@FQDN@",
  "delegate_dataset": true,
  "resolvers": [
    "8.8.8.8",
    "8.8.4.4"
  ],
  "max_physical_memory": 2048,
  "max_swap": 2048,
  "quota": 32,
  "nics": [
    {
      "nic_tag": "external",
      "ips": [ "@IPS@" ],
      "gateways": [ "@GATEWAYS@" ],
      "primary": true
    }
  ],
  "customer_metadata": {},
  "internal_metadata": {}
}
```

To create it based on the above template use `vmadm`:

```
[gz] $ vmadm create -f kumquat.json
```

## Usage

The management web interface should be only reachable via `https` and the
**FQDN** you configured. An example FQDN could look like
`https://web01.kumquat.example.com`.

You should be ask for an username and password to login. An automated password
is generated for the `admin` user during provisioning. To receive the
configured password it's required to login via `ssh` or `zlogin`.

```
[gz]      $ zlogin UUID
[kumquat] $ mdata-get kumquat_admin_initial_pw
```

The web interface provide you with the following (but not complete) list of web
management features:

- Domain management
- Virtual host management
- E-mail account and alias configuration, *data only*
- MySQL compatible database management
- FTP account management

## Limitation

The **core-kumquat** image does not provide you with an full functional e-mail
setup based on the Kumquat configuration. But it provides you with `nullmailer`
for you web application to send e-mails. Please checkout the Integration section
for additional details.

The management interface and image itself is limited to PHP based web hosting
and static file hosting.

## Integration

### E-mail

A full e-mail server is not part of the **core-kumquat** image. But it can be
integration with [mail.core.io](https://mail.core.io) our e-mail solution. All
in all Kumquat support a simple JSON export of e-mail accounts and aliases which
allow you to integrate it into your own solution.

The data can be received with an `GET` call including a secret token. The token
is automatically generated during the provision step and can be received via
`mdata-get`, as example

```
[kumquat] $ mdata-get core_mail_token
```

The export URL is accessible via `https://FQDN/mail/export.json?token=TOKEN`, for
example:

```
https://web01.kumquat.example.com/mail/export.json?token=iema3Phagoch6uphu8ai
```
