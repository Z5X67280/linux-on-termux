#!/system/bin/sh

wget_path=$(which wget)
real_wget=$(readlink -f $wget_path)
install_dir="$HOME/alpine"
rootfs_url='http://mirrors.ustc.edu.cn/alpine/v3.7/releases/armhf/alpine-minirootfs-3.7.0-armhf.tar.gz'

case $real_wget in
*busybox)
    echo "wget is linked from busybox.."
    echo "we cannot download https links!"
    echo "you should install wget before."
    exit 1
    ;;
esac

mkdir -p ${install_dir};
chmod 755 ${install_dir};

case ${rootfs_url} in
*xz)
    tar_args='xJvpf -'
    ;;
*gz)
    tar_args='xzvpf -'
    ;;
*bz2)
    tar_args='xjvpf -'
    ;;
esac


set -e;
cd ${install_dir};
wget -O - $rootfs_url | tar $tar_args;

cd ${install_dir}/../;
termix init ${install_dir};

echo "Install done."
echo "Use command termix boot <install_dir>"
echo "to boot your own linux in the next time :)"
