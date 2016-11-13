#!/bin/bash

while true;
do 
    export TERM="xterm";
    ssh irenicus@192.168.1.2 -t 'tmux a'; 
    sleep 10;
done
