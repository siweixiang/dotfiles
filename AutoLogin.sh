#!/bin/bash
# Script to auto reconnect wifi 
sleep_time=600;
file_name="index.html";

while true;
	do
		echo "";
		echo "===================================";
		ping -q -c3 "8.8.4.4"; 
		if [ $? -eq 0 ]	
		then
			echo ">> System Online";
		else 
		{
			echo ">> System Offline";
			echo ">> Reconnecting to Internet at `date`";
			curl -4 -d "txtLogin=hlwifi&txtPasswd=9999&btnLogin=Login" --header "Content-Type: application/x-www-form-urlencoded" http://login.hilife.com/portal/user-authen.php\?reqUrl\=http%3A%2F%2F172.16.10.1 1&>/dev/null;
		}
		fi	
		echo ">> Sleeping for $sleep_time seconds";
		echo "___________________________________";
		sleep $sleep_time;
	done
