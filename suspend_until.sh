#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: suspend_until HH:MM"
	exit
fi

DESIRED=$((`date +%s -d "$1"`))
NOW=$((`date +%s`))
if [ $DESIRED -lt $NOW ]; then
	DESIRED=$((`date +%s -d "$1"` + 24*60*60))
fi
echo "The desired wake time is $DESIRED"
sudo rtcwake -l -m off -t $DESIRED

echo "Suspending..."

sleep 2

#N.B. don't usually require this bit
#sudo pm-suspend

xset dpms force on
clear
echo "Good morning!"
