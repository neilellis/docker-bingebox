#!/usr/bin/env bash
folders=( "couchpotato" "deluge" "headphones" "nginx" "nzbget" "plex" "sonarr" "." )
for i in "${!folders[@]}"
do
    if [ $(($i % $CIRCLE_NODE_TOTAL)) -eq $CIRCLE_NODE_INDEX ]
    then
        if [[ ${i} == "." ]]
        then
            docker build -t ipsq/docker-bingebox .
        else
            docker build -t "ipsq/docker-bingebox-${folders[$i]}" "./${folders[$i]}/"
        fi
    fi
done