#!/usr/bin/env bash

BATTERY_OBJ_PATH="/org/freedesktop/UPower/devices/battery_BAT1"

BRIGHTNESS_SAVED=65535
BAT_NEXT_WARN=100

BAT_STATE="charging"
BAT_PERCENTAGE=100

/usr/bin/upower -i "${BATTERY_OBJ_PATH}" --monitor-detail | while read UP_OUT; do
  if [[ "${UP_OUT}" =~ ^"state: " ]]; then
    BAT_STATE=${UP_OUT#*state: }
    BAT_STATE=$(printf "%s" $BAT_STATE) # Trim leading whitespace
  elif [[ "${UP_OUT}" =~ ^"percentage: " ]]; then
    BAT_PERCENTAGE=${UP_OUT#*percentage: }
    BAT_PERCENTAGE=${BAT_PERCENTAGE%\%} # Trim trailing percent sign
    BAT_PERCENTAGE=$(printf "%s" $BAT_PERCENTAGE) # Trim leading whitespace
  else
    continue
  fi

  if [[ "${BAT_STATE}" == "charging" ]]; then
    BAT_NEXT_WARN=100
    /usr/bin/brightnessctl set ${BRIGHTNESS_SAVED}
    continue
  fi

  if [[ ${BAT_PERCENTAGE} -lt 10 && ${BAT_NEXT_WARN} -ge 10 ]]; then
    /usr/bin/notify-send \
      -i /usr/share/icons/Adwaita/symbolic/status/battery-level-10-symbolic.svg \
      -u critical \
      Battery \
      "Battery at ${BAT_PERCENTAGE}%"

      BAT_NEXT_WARN=0

  elif [[ ${BAT_PERCENTAGE} -lt 20 && ${BAT_NEXT_WARN} -ge 20 ]]; then
    /usr/bin/notify-send \
      -i /usr/share/icons/Adwaita/symbolic/status/battery-level-20-symbolic.svg \
      -u normal \
      -t 30000 \
      Battery \
      "Battery at ${BAT_PERCENTAGE}%"

      BRIGHTNESS_SAVED=$(/usr/bin/brightnessctl get)
      /usr/bin/brightnessctl set 30%

      BAT_NEXT_WARN=10

  elif [[ ${BAT_PERCENTAGE} -lt 30 && ${BAT_NEXT_WARN} -ge 30 ]]; then
    /usr/bin/notify-send \
      -i /usr/share/icons/Adwaita/symbolic/status/battery-level-30-symbolic.svg \
      -u normal \
      -t 30000 \
      Battery \
      "Battery at ${BAT_PERCENTAGE}%"

      BAT_NEXT_WARN=20     

  elif [[ ${BAT_PERCENTAGE} -lt 50 && ${BAT_NEXT_WARN} -ge 50 ]]; then
    /usr/bin/notify-send \
      -i /usr/share/icons/Adwaita/symbolic/status/battery-level-50-symbolic.svg \
      -u normal \
      -t 10000 \
      Battery \
      "Battery at ${BAT_PERCENTAGE}%"

      BAT_NEXT_WARN=30
  fi

  echo ${BAT_STATE}
  echo ${BAT_PERCENTAGE}
done
