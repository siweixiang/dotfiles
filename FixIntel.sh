#!/bin/bash
#
#
# This script was coded to optimise internal Atheros Wireless Network Adapter
#
# Author  : irenicus09
# Date    : 1/8/2015
# License : GPLv3
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
driver="ath9k";

#=============================================================================
echo ""
echo "==================================================================="
echo "		Welcome to Automated Wireless Optimiser";
echo "==================================================================="
sleep 1;

echo "[+] Stopping Network Manager... ";
systemctl stop NetworkManager.service; #1>/dev/null;
wait;
pkill NetworkManager;

# Disabling RFKILL on Wifi
rfkill unblock wifi all;

# Reloading modules from kernel
echo "[+] Reloading modules";
rmmod $driver;
modprobe $driver;


echo "[+] Taking down your card offline";
ifconfig $interface down;


echo "[+] Changing mac-address";
macchanger -r $interface;

iwconfig $interface mode managed;
iwconfig $interface power off;

echo "[+] Bringing up wireless card online";
ifconfig $interface up;

echo "[+] Starting Network Manager... ";
systemctl start NetworkManager.service; #1>/dev/null;
wait;
NetworkManager;
sleep 1;

echo "[+] All patched up and done, have a nice day! ;)";
echo "===================================================================\n"

exit 0;
