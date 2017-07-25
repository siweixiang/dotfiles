#!/bin/sh

url=$(xclip -o);

if [ $? -eq 0 ] 
then 
    mpv $url;
else 
    exit 1;
fi

exit 0;
