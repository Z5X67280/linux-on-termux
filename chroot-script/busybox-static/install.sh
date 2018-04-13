#!/system/bin/sh

export PATH="/system/bin:/system/xbin";

uid=`id`; uid=${uid%% *}; uid=${uid#*=};
[ $uid != "0(root)" ] && {
  echo "Please run this script as root!";
  echo "Current run as uid=${uid}."
  exit 1;
};

mount -o rw,remount /system;
cp busybox /system/xbin/busybox;
chmod 4755 /system/xbin/busybox;
chown root:shell /system/xbin/busybox;

set -e; # If failed, then exit.
cd /system/xbin; # No abspath!
./busybox --list | while read cmd; do
  ln -sf busybox $cmd;
done; mount -o ro,remount /system;

echo "*********************"
echo "* Busybox installed!"
echo "*********************"

