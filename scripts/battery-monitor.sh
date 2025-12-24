#!/usr/bin/sh

BATTERY_PATH=/sys/class/power_supply/BAT1

if [[ ! -d ${BATTERY_PATH} ]]; then
  return 1;
fi

LAST_WARNING_PERCENT=100
CHARGE_FULL=$(cat ${BATTERY_PATH}/charge_full)

while [[ True ]]; do
  BATTERY_STATE=$(cat ${BATTERY_PATH}/status)

  if [[ "${BATTERY_STATE}" == "Discharging" ]]; then
    CHARGE_NOW=$(cat ${BATTERY_PATH}/charge_now)
    CHARGE_NOW_PERCENT=$((100 * ${CHARGE_NOW}/${CHARGE_FULL}))

    if [[ ${CHARGE_NOW_PERCENT} -lt 10 && ${LAST_WARNING_PERCENT} -gt 10 ]]; then
      notify-send -i /usr/share/icons/Adwaita/symbolic/status/battery-level-10-symbolic.svg \
        -u critical Battery "Battery at ${CHARGE_NOW_PERCENT}%"
      LAST_WARNING_PERCENT=10

    elif [[ ${CHARGE_NOW_PERCENT} -lt 20 && ${LAST_WARNING_PERCENT} -gt 20 ]]; then
      notify-send -t 30000 -i /usr/share/icons/Adwaita/symbolic/status/battery-level-20-symbolic.svg \
        -u normal Battery "Battery at ${CHARGE_NOW_PERCENT}%"
      BRIGHTNESS_SAVED=$(brightnessctl get)
      brightnessctl set 30%
      LAST_WARNING_PERCENT=20

    elif [[ ${CHARGE_NOW_PERCENT} -lt 30 && ${LAST_WARNING_PERCENT} -gt 30 ]]; then
      notify-send -t 30000 -i /usr/share/icons/Adwaita/symbolic/status/battery-level-30-symbolic.svg \
        -u low Battery "Battery at ${CHARGE_NOW_PERCENT}%!" 
      LAST_WARNING_PERCENT=30
    fi
  else
    LAST_WARNING_PERCENT=100

    if [[ ! -z "${BRIGHTNESS_SAVED}" ]]; then
      brightnessctl set ${BRIGHTNESS_SAVED}
      BRIGHTNESS_SAVED=""
    fi
  fi

  sleep 20
done
