#!/usr/bin/env bash
set -e

git -C /CouchPotatoServer pull origin master

python /CouchPotatoServer/CouchPotato.py --data_dir "/data"