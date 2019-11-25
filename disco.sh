#!/bin/bash
while true; do  
  battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
  status=$(cat /sys/class/power_supply/AC/online)
  if [ $battery_level -le 20 ] && [ $status == "0" ]
    then
      notify-send -i /usr/share/icons/Numix/32/devices/battery-caution.svg "Battery low" "Battery level is ${battery_level}%!"
  fi
  sleep 300;
done
