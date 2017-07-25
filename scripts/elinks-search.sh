#!/bin/sh
# Simple script to automate search using elinks
# Requirements: zenity
[[ "$#" -ne 1 ]] && exit 1;

if $( ! [[ "$1" = "google" || "$1" = "startpage" ]] ); then
    exit 1
fi

link=""

url=$(zenity --entry --text="Search Query" --entry-text="");

if [[ "$?" -eq 0 ]]; then 

    if [[ "$1" = "google" ]]; then
        link="https://www.google.com/search?hl=en&q=$url"
    elif [[ "$1" = "startpage" ]]; then
        link="https://classic.startpage.com/do/asearch?q=$url"
    fi

    firejail elinks "$link"

else 
    exit 1
fi

exit 0
