#!/bin/sh

url=$(parcellite -c 2>/dev/null);


if [ $? -eq 0 ] 
then 
		mpv $(echo "$url");
else 
	exit 1;
fi

exit 0;
