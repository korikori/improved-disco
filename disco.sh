#!/bin/bash
while true; do  
  battery1_level=`acpi -b | grep -P -o -m 1 '[0-9]+(?=%)'`
  battery2_level=`acpi -b | tail -n 1 | grep -P -o -m 3 '[0-9]+(?=%)'`
  if [ "$battery1_level" -gt "$battery2_level" ]; then
    warning="Battery level is ${battery2_level}%!" 
  else
    warning="Battery level is ${battery1_level}%!" 
  fi
  status=$(cat /sys/class/power_supply/AC/online)
  if [ $battery1_level -le 20 -o $battery2_level -le 20 ] && [ $status == "0" ]
    then
      notify-send -i /usr/share/icons/Numix/32/devices/battery-caution.svg "Low battery" "$warning"  
  fi
  sleep 300;
done
