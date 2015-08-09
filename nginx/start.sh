#!/usr/bin/env bash
sed -i 's/PLEX_IP/'"$PLEX_PORT_32400_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/SONARR_IP/'"$SONARR_PORT_8989_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/COUCHPOTATO_IP/'"$COUCHPOTATO_PORT_5050_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/HEADPHONES_IP/'"$HEADPHONES_PORT_8181_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/NZBGET_IP/'"$NZBGET_PORT_6789_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/DELUGE_IP/'"$DELUGE_PORT_8112_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox

cat /etc/nginx/sites-enabled/bingebox

nginx