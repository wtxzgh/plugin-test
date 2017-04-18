#!/bin/sh
cru a $hostname-$weekday-$hour-$min "$min $hour * * $weekday /usr/sbin/ether-wake -i br0 $macaddress"

