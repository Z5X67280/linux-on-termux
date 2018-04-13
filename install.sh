#!/system/bin/sh

[ x$PREFIX = "x" ] && exit 1;

DEST_DIR="$PREFIX/bin"
CHROOT_TOOLS_DIR="chroot-script"
PROOT_TOOLS_DIR="proot-scripts"

echo "Type which type your want to install."
echo "[cC] for chroot [pP] for proot. [c/p]"
echo -n "Choose:" && read choose;

install_termix_chroot() {
    [ -e $CHROOT_TOOLS_DIR ] || return;

    set -e;
    cp $CHROOT_TOOLS_DIR/termix $DEST_DIR || \
                    chmod a+x $DEST_DIR/termix;

    if [ $? = 0 ]; then
	echo "***************************";
        echo "* Termix install success!";
	echo "***************************\n";
    fi;

    cat <<TIPS
********* USEFUL GUIDE OF CHROOT VERSION

There are some tools in the $CHROOT_TOOLS_DIR,
You can use it to fix some issues in the linux.

For example:
  * $CHROOT_TOOLS_DIR/patch/group-patch.sh
    It can slove normal user can not access /sdcard or can not connect to internet.

  * $CHROOT_TOOLS_DIR/busybox-static
    It can install a busybox on your devices that if you don't have any busybox installed.

********* END OF USEFUL GUIDE OF CHROOT VERSION
TIPS
}

install_termix_proot() {
    [ -e $PROOT_TOOLS_DIR ] || return;

    set -e;
    cp $PROOT_TOOLS_DIR/termix $DEST_DIR || \
                   chmod a+x $DEST_DIR/termix;

    if [ $? = 0 ]; then
	echo "***************************";
        echo "* Termix install success!";
	echo "***************************";
    fi;
}

case $choose in
[cC]*)
    install_termix_chroot;
    ;;
[pP]*)
    install_termix_proot;
    ;;
*)
    echo "Choose error!";
    ;;
esac;

