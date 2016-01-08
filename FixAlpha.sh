#!/bin/bash

# Killing all instance of processes that might interfere with network
systemctl stop NetworkManager.service;
wait;
killall NetworkManager; killall wpa_supplicant; killall dhclient; 

# Killing Thermald & restarting it to control temperature
killall thermald;
thermald --exclusive-control;
wait;

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
