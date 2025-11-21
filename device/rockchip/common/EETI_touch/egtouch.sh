#!/system/bin/sh

egtouch=0
setprop sys.eGTouchD 0

while :
do
  service_sta=`getprop sys.eGTouchD`
  egtouch=`cat /sys/module/usbhid/parameters/egtouch_connect`
  if [ $service_sta -ne $egtouch ] ; then 
    setprop sys.eGTouchD $egtouch
    if [ $egtouch -eq 0 ] ; then 
      /system/bin/eGTouchD -k
    fi
  fi
  sleep 3
done
