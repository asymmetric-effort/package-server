#!/bin/bash

sync_mirror() {
  /usr/bin/apt-mirror
}

set -e

sync_mirror &

/usr/sbin/nginx
