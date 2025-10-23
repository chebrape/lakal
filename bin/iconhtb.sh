#!/bin/sh

NANO=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')

if [ "$NANO" = "tun0" ]; then
		echo -n "%{F#9fef00}%{u-}"
else
		echo -n "%{F#E57373}%{u-}"
fi
