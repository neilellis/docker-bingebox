#!/usr/bin/env bash

mkdir -p /etc/nginx/sonarr/
sudo htpasswd -bc /etc/nginx/sonarr/.htpasswd sonarr "${SONARR_ENV_SONARR_PASSWORD}"

mkdir -p /etc/nginx/plex/
sudo htpasswd -bc /etc/nginx/plex/.htpasswd plex "${PLEX_ENV_PLEX_PASSWORD}"

sed -i 's/PLEX_IP/'"$PLEX_PORT_32400_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/SONARR_IP/'"$SONARR_PORT_8989_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/COUCHPOTATO_IP/'"$COUCHPOTATO_PORT_5050_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/HEADPHONES_IP/'"$HEADPHONES_PORT_8181_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/NZBGET_IP/'"$NZBGET_PORT_6789_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox
sed -i 's/DELUGE_IP/'"$DELUGE_PORT_8112_TCP_ADDR"'/g' /etc/nginx/sites-enabled/bingebox

cat /etc/nginx/sites-enabled/bingebox

nginx