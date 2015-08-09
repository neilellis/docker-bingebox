#!/usr/bin/env bash
set -e

test -f /config/Plex\ Media\ Server/plexmediaserver.pid && \
    rm -f /config/Plex\ Media\ Server/plexmediaserver.pid;

ulimit -s 3000 && /usr/lib/plexmediaserver/Plex\ Media\ Server