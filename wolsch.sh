#!/bin/sh
add(){
cru a $hostname$weekday$h$m "$m $h * * $weekday /usr/sbin/ether-wake -i br0 $macaddress"
echo 'cru a $hostname$weekday$h$m "$m $h * * $weekday /usr/sbin/ether-wake -i br0 $macaddress"' >> /jffs/scripts/services-start

# example: cru a nas025930 "30 9 * * 0,2,5 /usr/sbin/ether-wake -i br0 AB:AB:AB:AB:AB:AB"
}

remove(){
cru d $hostname$weekday$h$m
sed -i '/$hostname$weekday$h$m/d' /var/spool/cron/crontabs/* >/dev/null 2>&1
sed -i '/$hostname$weekday$h$m/d' /jffs/scripts/services-start >/dev/null 2>&1
}