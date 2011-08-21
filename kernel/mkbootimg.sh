#!/sbin/sh
echo \#!/sbin/sh > /tmp/createnewboot.sh
mkdir /cust
mount cust
cp /cust/image/boot.img /tmp/boot.img
/tmp/unpackbootimg /tmp/boot.img /tmp/
echo /tmp/mkbootimg --kernel /tmp/zImage --ramdisk /tmp/boot.img-ramdisk.gz --cmdline \"$(cat /tmp/boot.img-cmdline)\" --base 0x00200000 --pagesize 4096 --output /tmp/newboot.img >> /tmp/createnewboot.sh
chmod 777 /tmp/createnewboot.sh
/tmp/createnewboot.sh
cp /tmp/newboot.img /cust/image/boot.img
return $?
