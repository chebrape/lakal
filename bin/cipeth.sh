#!/bin/sh

echo -n "$(/usr/sbin/ifconfig  enp3s0 | grep "inet " | awk '{print $2}')"
