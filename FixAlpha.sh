#!/bin/bash
#
# Author  : irenicus09
# Date    : 9/1/2016
# License : GPLv3
#
# This script was coded to optimise Wireless Alfa Awus036NH Network Adapter
# Copyright © 2016 irenicus09
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
############################################################################################



if [ $# -ne 1 ]
then
        echo "Automated Wireless Optimiser";
        echo "Usage: $0 [interface]";
        exit 1;
fi

interface=$1;



# Killing all instance of processes that might interfere with network
systemctl stop NetworkManager.service;
wait;
killall NetworkManager; killall wpa_supplicant; killall dhclient; 

# Killing Thermald & restarting it to control temperature
killall thermald;
thermald --exclusive-control;
wait;

#TODO 1) Check module is loaded or not before unloading
# Removing all known drivers
rmmod ath9k;
rmmod rt2800usb;
wait;

# Reloading Alpha driver & Fixing network
modprobe rt2800usb;
wait;
ifconfig wlan0 down; macchanger -r wlan0; ifconfig wlan0 up;
wait;
systemctl daemon-reload;
wait;
systemctl start NetworkManager.service;
wait;
