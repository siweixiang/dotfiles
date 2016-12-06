#!/bin/bash
# Script to get grab url from clipboard,
# download file from url to /tmp directory using wget 
# & displaying using native file handlers
url=$(xclip -o);
filename=$(date +%y%m%d%H%M%S);
wget -c --content-disposition $url -O /tmp/$filename;

if [ $? -eq 0 ] 
then 
    /usr/bin/gpicview /tmp/$filename;

else 
    exit 1;
fi

exit 0;
