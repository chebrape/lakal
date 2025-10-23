#!/bin/sh

tarip=$(cat /home/ilmater/.config/bin/.target | awk '{print $1}')
tarname=$(cat /home/ilmater/.config/bin/.target | awk '{print $2}')

if [ $tarip ] && [ $tarname ]; then
	echo "%{F#ffffff}$tarip%{u-} - $tarname"
else
	echo "I am the TABLE"
fi
