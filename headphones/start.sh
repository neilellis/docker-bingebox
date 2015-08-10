#!/usr/bin/env bash
set -e

git clone https://github.com/rembo10/headphones.git /headphones

python /headphones/Headphones.py --datadir=/data --config=/data/headphones.ini