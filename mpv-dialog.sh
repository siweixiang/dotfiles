#!/bin/sh
# Simple script to make mpv play youtube url without opening terminal
# Requirements: zenity
url=$(zenity --entry --text="Select Youtube URL" --entry-text="URL");

if [ $? -eq 0 ] 
then 
	mpv "$url"
else 
	exit 1;
fi

exit 0;
