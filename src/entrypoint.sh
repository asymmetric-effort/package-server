#!/bin/bash

sync_mirror() {
  /usr/bin/apt-mirror && echo "" > /var/www/html/ready
}

set -e

sync_mirror &

/usr/sbin/nginx
