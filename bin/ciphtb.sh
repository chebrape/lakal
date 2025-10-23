#!/bin/sh

NANO=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')

if [ "$NANO" = "tun0" ]; then
		echo -n "$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')"
else
		echo -n "Unplugged"
fi
