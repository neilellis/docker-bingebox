#!/usr/bin/env bash
set -e

function handle_signal {
  PID=$!
  echo "received signal. PID is ${PID}"
  kill -s SIGHUP ${PID}
}

trap "handle_signal" SIGINT SIGTERM SIGHUP

mkdir -p /root/.config
[ ! -L /root/.config/NzbDrone ] && ln -s /data /root/.config/NzbDrone

mono /opt/NzbDrone/NzbDrone.exe