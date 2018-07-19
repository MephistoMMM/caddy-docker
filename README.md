This project is forked from `abiosoft/caddy-docker`. And I modified it to make it be more convenient to use.

# caddy

A [Docker](https://docker.com) image for [Caddy](https://caddyserver.com). This image includes no plugin.


[![](https://images.microbadger.com/badges/image/abiosoft/caddy.svg)](https://microbadger.com/images/abiosoft/caddy "Get your own image badge on microbadger.com")
[![](https://img.shields.io/badge/version-0.11.0-blue.svg)](https://github.com/mholt/caddy/tree/v0.11.0)

Check [MephistoMMM/caddy:builder](https://github.com/MephistoMMM/caddy-docker/blob/master/BUILDER.md) for generating cross-platform Caddy binaries.

### License

This image is built from [source code](https://github.com/mholt/caddy). As such, it is subject to the project's [Apache 2.0 license](https://github.com/mholt/caddy/blob/baf6db5b570e36ea2fee30d50f879255a5895370/LICENSE.txt), but it neither contains nor is subject to [the EULA for Caddy's official binary distributions](https://github.com/mholt/caddy/blob/545fa844bbd188c1e5bff6926e5c410e695571a0/dist/EULA.txt).

### Let's Encrypt Subscriber Agreement
Caddy may prompt to agree to [Let's Encrypt Subscriber Agreement](https://letsencrypt.org/documents/2017.11.15-LE-SA-v1.2.pdf). This is configurable with `ACME_AGREE` environment variable. Set it to true to agree. `ACME_AGREE=true`.

## Getting Started

This image is started by [docker-compose](https://docs.docker.com/compose/), you have to install it first. If you had, run following script: 

```sh
$ ./init.sh path/to/service_dir
```

This script will build some necessary docker images, create your service_dir if it doesn't exist, and finally run the caddy server in docker container.

Point your browser to `http://127.0.0.1:80`.

All of running configurations could be modified in [docker-compose.yml](https://github.com/MephistoMMM/caddy-docker/blob/master/docker-compose.yml), except *Paths in container*.

#### Paths in container

Caddyfile: `/root/conf/Caddyfile`

Sites root: `/root/srv`

### Let's Encrypt Auto SSL
**Note** that this does not work on local environments.

Use a valid domain and add email to your Caddyfile to avoid prompt at runtime.
Replace `mydomain.com` with your domain and `user@host.com` with your email.
```
mydomain.com
tls user@host.com
```
