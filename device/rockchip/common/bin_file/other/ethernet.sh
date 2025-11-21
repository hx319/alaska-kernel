#!/system/bin/sh

eth0_up=`cat /sys/class/net/eth0/carrier`
eth1_up=`cat /sys/class/net/eth1/carrier`

setprop sys.tmp.eth_multi 1

if [ $eth0_up == "1" ] ; then
  if [ $eth1_up == "1" ] ; then
    setprop sys.tmp.eth_multi 0
    sleep 7

    setprop sys.tmp.eth_multi 1
    /system/bin/ifconfig eth1 down
    /system/bin/ifconfig eth1 up
    sleep 2
    /system/bin/ifconfig eth0 down
    /system/bin/ifconfig eth0 up
  fi
fi

eth_reup=`getprop sys.tmp.eth_reup`
if [ $eth_reup == "1" ] ; then
  /system/bin/ifconfig eth1 down
  /system/bin/ifconfig eth1 up
  /system/bin/ifconfig eth0 down
  /system/bin/ifconfig eth0 up
fi
