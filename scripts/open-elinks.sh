#!/bin/bash
# Script to open clipboard link using elinks browser
url=$(xclip -o);

if [ $? -eq 0 ]
then
    urxvtc -e firejail elinks "$url";
else
    exit 1;
fi

exit 0;

