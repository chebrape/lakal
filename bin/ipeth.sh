#!/bin/sh

echo "%{F#ffffff}$(/usr/sbin/ifconfig  enp3s0 | grep "inet " | awk '{print $2}')%{u-}"
