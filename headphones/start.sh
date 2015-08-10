#!/usr/bin/env bash
set -e

git clone https://github.com/rembo10/headphones.git /headphones

[ ! -e /data/config.ini ] && mv /tmp/config.ini /data/config.ini

python /headphones/Headphones.py --datadir=/data