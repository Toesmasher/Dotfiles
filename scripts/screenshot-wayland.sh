#!/usr/bin/env sh

TYPE="$1"

if [ -z "${TYPE}" ]; then
  grim screen.png
elif [ "${TYPE}" == "region" ]; then
  grim -g "$(slurp)" region.png
elif [ "${TYPE}" == "region-copy" ]; then
  grim -g "$(slurp)" - | wl-copy
else
  echo "arg must be <none>, region, or region-copy"
  exit 1
fi
