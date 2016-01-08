#!/bin/bash


if [ "$#" -ne 2 ]
	then
		echo "";
		echo ">>> Insufficient arguments detected..";
		echo;
		echo "Usage: ./configure.sh [interface] [mode]";
		echo "       ./configure.sh wlan0 monitor";
		exit 1;
fi




interface=$1
mode=$2

echo ">> Configuring interface $interface";
ifconfig $interface down; 
macchanger -r $interface; 
iwconfig $interface mode $mode; 
ifconfig $interface up;
wait;
echo ">> Finished at `date`";
exit 0;
