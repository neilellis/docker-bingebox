#!/usr/bin/env bash

## TODO Detect the input given by the user e.g. run / update etc.

echo "=> Starting docker"
wrapdocker > /dev/null 2>&1 &
echo "=> Checking docker daemon"
LOOP_LIMIT=60
for (( i=0; ; i++ )); do
    if [ ${i} -eq ${LOOP_LIMIT} ]; then
        print_msg "   Failed to start docker (did you use --privileged when running this container?"
        exit 1
    fi
    sleep 1
    docker version > /dev/null 2>&1 && break
done

cd ../bingebox/ && docker-compose up