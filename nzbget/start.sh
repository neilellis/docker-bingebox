#!/usr/bin/env bash
set -e

[ ! -f /data/nzbget.conf ] && cp /usr/local/share/nzbget/nzbget.conf /data/nzbget.conf

[ ! -f /data/nzbget.log ] && touch /data/nzbget.log

nzbget --configfile /data/nzbget.conf --daemon
tail -f /data/nzbget.log