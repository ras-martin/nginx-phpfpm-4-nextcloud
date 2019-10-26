# Docker-Image with Nginx + PHP-FPM optimized & configured for Nextcloud

[![Build Status](https://travis-ci.org/ras-martin/nginx-phpfpm-4-nextcloud.svg?branch=master)](https://travis-ci.org/ras-martin/nginx-phpfpm-4-nextcloud)

* [Docker Hub](https://hub.docker.com/r/rasmartin/nginx-phpfpm-4-nextcloud)
* [GitHub](https://github.com/ras-martin/nginx-phpfpm-4-nextcloud)

This is a custom Docker-Image based on [Nginx](https://www.nginx.com/) and [PHP-FPM](https://www.php.net/) to host your private [Nextcloud](https://nextcloud.com/)-Instance.

Nextcloud itself is not included in this image!

The Nginx-Configuration and PHP-FPM is optimized for a small Nextcloud-Instance.

## Distributions

At the moment the following distributions are support:
* [Alpine Linux](https://alpinelinux.org/) amd64
* [Alpine Linux](https://alpinelinux.org/) armhf (arm 32bit)

The included `build.sh` can be used to build the required Docker-Image.

## Nextcloud on a Raspberry Pi

The build for armhf can be used on a [Raspberry Pi](https://www.raspberrypi.org/). A Raspberry Pi 3 or 4 with at least 2GB Memory is recommended.

## FAQ's

### Where do I have to mount the docroot to?

The Nextcloud docroot must be mounted to `/application/src`.

### How to overwrite PHP settings?

If it is required to overwrite PHP settings, create a custom configuration file ([php.ini](https://www.php.net/manual/en/ini.list.php) style) which contains the required configurations and mount it with `docker run` to `/etc/php7/conf.d/zzz-override.ini`.

### Why there is PHP Opcache file blacklist?

The purpose of this file blacklist is quite simple. When you are using `occ` (see [Nextcloud OCC](https://docs.nextcloud.com/server/15/admin_manual/configuration_server/occ_command.html)) it could happen that your Nextcloud `config/config.php` is modified, for example if you turning maintenance mode on/off with `occ maintenance:mode --[on|off]`. But if the config-file is in Opcache, the maintenance mode setting wouldn't have any effect until your restart/reload the PHP-FPM (or reset the Opcache through other ways).
