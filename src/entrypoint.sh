#!/bin/bash

sync_mirror() {
  /usr/bin/apt-mirror && echo "set $ready 1;" >/etc/nginx/ready.conf
}

set -e

sync_mirror &

/usr/sbin/nginx
