#!/bin/bash
#
# Author  : irenicus09
# Date    : 9/1/2016
# License : GPLv3
# Dependencies: macchanger
#
# This script was coded to optimise internal Atheros Wireless Network Adapter
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

# Change driver as appropriate for your card, default driver for Atheros AR9485: ath9k
intel="ath9k";
alfa="rt2800usb";

#=============================================================================
echo ""
echo "==================================================================="
echo "		Welcome to Automated Wireless Optimiser";
echo "==================================================================="
sleep 1;

echo "[+] Stopping Network Manager... ";
systemctl stop NetworkManager.service 1>/dev/null;
wait;

# Disabling RFKILL on Wifi
rfkill unblock wifi all;

# Reloading modules from kernel
echo "[+] Reloading modules";
rmmod $intel 1>/dev/null;
modprobe $intel;


echo "[+] Taking down your card offline";
ifconfig $interface down;


echo "[+] Changing mac-address";
macchanger -r $interface;

iwconfig $interface mode managed;
iw dev $interface  set power_save on;

sleep 2;
echo "[+] Bringing up wireless card online";
ifconfig $interface up;

sleep 2;
wait;
systemctl daemon-reload;
wait;
echo "[+] Starting Network Manager... ";
systemctl start NetworkManager.service; #1>/dev/null;
wait;

echo "[+] All patched up and done, have a nice day! ;)";
echo "===================================================================\n"

exit 0;
