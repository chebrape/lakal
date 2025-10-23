#!/bin/sh

tarip=$(cat /home/ilmater/.config/bin/.target | awk '{print $1}')

if [ $tarip ]; then
	echo -n "$tarip"
else
	echo -n "NoTables"
fi
