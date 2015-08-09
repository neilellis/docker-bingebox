#!/usr/bin/env bash
function handle_signal {
  PID=$!
  echo "received signal. PID is ${PID}"
  kill -s SIGHUP ${PID}
}

trap "handle_signal" SIGINT SIGTERM SIGHUP

echo "Starting Sonarr"
mono /opt/NzbDrone/NzbDrone.exe --no-browser -data=/volumes/config/sonarr & wait
echo "Stopping Sonarr"