# Docker-Image with Nginx + PHP-FPM optimized & configured for Nextcloud

This is a custom Docker-Image based on [Nginx](https://www.nginx.com/) and [PHP-FPM](https://www.php.net/) to host your private [Nextcloud](https://nextcloud.com/)-Instance.

Nextcloud itself is not included in this image!

The Nginx-Configuration and PHP-FPM is optimized for a small Nextcloud-Instance.

## Distributions

At the moment the following distributions are support:
* [Alpine Linux](https://alpinelinux.org/) amd64
* [Alpine Linux](https://alpinelinux.org/) armhf (arm 32bit)

The included build.sh can be used to build the required Docker-Image.

## Nextcloud on a Raspberry Pi

The build for armhf can be used on a [Raspberry Pi](https://www.raspberrypi.org/). A Raspberry Pi 3 or 4 with at least 2GB Memory is recommended.