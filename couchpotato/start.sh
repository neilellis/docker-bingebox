#!/usr/bin/env bash
set -e

git clone https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer

python /CouchPotatoServer/CouchPotato.py --data_dir "/data"