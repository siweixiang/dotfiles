#!/bin/bash
# Script to open clipboard link using elinks browser
url=$(parcellite -c 2>/dev/null);

if [ $? -eq 0 ]
then
    /usr/bin/termite -e "/usr/bin/elinks $url";
else
     exit 1;
fi
 
exit 0;

