#!/usr/bin/env bash
echo "Starting docker"
wrapdocker > /dev/null 2>&1 &
echo "Checking docker daemon"
LOOP_LIMIT=60
for (( i=0; ; i++ )); do
    if [ ${i} -eq ${LOOP_LIMIT} ]; then
        echo "Failed to start docker (did you use --privileged when running this container?"
        exit 1
    fi
    sleep 1
    docker version > /dev/null 2>&1 && break
done

if [[ "$DELUGE_PASSWORD" == "**GENERATE**" ]]
then
    export DELUGE_PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16})
fi

echo "*******************************************"
echo "Deluge Username: deluge"
echo "Deluge Password: $DELUGE_PASSWORD"
echo "*******************************************"

if [[ "$NZBGET_PASSWORD" == "**GENERATE**" ]]
then
    export NZBGET_PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16})
fi

echo "*******************************************"
echo "NZBGET Username: nzbget"
echo "NZBGET Password: $NZBGET_PASSWORD"
echo "*******************************************"

if [[ "$SONARR_PASSWORD" == "**GENERATE**" ]]
then
    export SONARR_PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16})
fi

echo "*******************************************"
echo "Sonarr Username: sonarr"
echo "Sonarr Password: $SONARR_PASSWORD"
echo "*******************************************"

if [[ "$COUCHPOTATO_PASSWORD" == "**GENERATE**" ]]
then
    export COUCHPOTATO_PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16})
fi

echo "*******************************************"
echo "Couch Potato Username: couchpotato"
echo "Couch Potato Password: $COUCHPOTATO_PASSWORD"
echo "*******************************************"

if [[ "$HEADPHONES_PASSWORD" == "**GENERATE**" ]]
then
    export HEADPHONES_PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16})
fi

echo "*******************************************"
echo "Headphones Username: headphones"
echo "Headphones Password: $HEADPHONES_PASSWORD"
echo "*******************************************"

if [[ "$PLEX_PASSWORD" == "**GENERATE**" ]]
then
    export PLEX_PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16})
fi

echo "*******************************************"
echo "Plex Username: plex"
echo "Plex Password: $PLEX_PASSWORD"
echo "*******************************************"

cd /bingebox && docker-compose up