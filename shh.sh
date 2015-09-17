#!/bin/bash

trap -- 'osascript -e "set Volume 0"; exit' INT TERM EXIT

while :
do
	sleep 42 & wait $!
done
