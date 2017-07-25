#!/bin/bash

# Filename: xbacklight_ddx.sh 
# Author:   irenicus09
# Date:     12/03/2017

config_path="/sys/class/backlight/intel_backlight";
read -r current_brightness < "$config_path/actual_brightness";
read -r max_brightness < "$config_path/max_brightness"; 
amount=50; # Amount by which to increase/decrease brightness

case $1 in
    inc) current_brightness=$(($current_brightness + $amount));;
    dec) current_brightness=$(($current_brightness - $amount));;
    min) current_brightness=1;;
    max) current_brightness=$max_brightness;;
    *) echo "Oh boy!" && exit 1;;
esac

if (($current_brightness < 1)) || (($current_brightness > $max_brightness));
then
    exit 1;
else
    echo $current_brightness > "$config_path/brightness";
fi

exit 0;
