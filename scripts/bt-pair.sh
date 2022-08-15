#!/usr/bin/env sh

ONOFF="$1"
MAC_SONY="14:3F:A6:A8:BA:90"
ARG=""

if [ -z "${ONOFF}" ]; then
  echo "No on/off given"
  exit 1
elif [ "${ONOFF}" == "on" ]; then
  ARG="connect"
elif [ "${ONOFF}" == "off" ]; then
  ARG="disconnect"
else
  echo "No on/off given"
  exit 1
fi


bluetoothctl power on
sleep 5
bluetoothctl ${ARG} ${MAC_SONY}
