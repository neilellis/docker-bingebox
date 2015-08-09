#!/usr/bin/env bash
set -e

git -C /headphones pull origin master

python /headphones/Headphones.py --datadir=/data --config=/data/headphones.ini