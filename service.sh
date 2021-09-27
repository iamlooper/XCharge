#!/system/bin/sh
# XCharge 2021

export PATH=/sbin:/sbin/su:/su/bin:/su/xbin:/system/bin:/system/xbin
MODPATH="/data/adb/modules/xcharge"

# Sleep until boot completed
until [ "$(getprop sys.boot_completed)" = "1" ] || [ "$(getprop dev.bootcomplete)" = "1" ]
do
       sleep 1
done

# Sleep until some time to complete boot and init
sleep 60

# Start XCharge (for NOW ONLY double execution)
$MODPATH/script/xcharge.sh >> /storage/emulated/0/xcharge.txt
sh ${MODPATH}/script/xcharge.sh >> /storage/emulated/0/xcharge.txt