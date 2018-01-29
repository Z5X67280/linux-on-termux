
# 用法说明：  

1. 下载从网站上下载符合设备架构的rootfs.tar.xz

> $ wget -c http://dl-cdn.alpinelinux.org/alpine/v3.7/releases/aarch64/alpine-minirootfs-3.7.0-aarch64.tar.gz

2. 新建一个目录作为根目录并进入目录

> $ mkdir root && cd root

3. 将termix复制到$PREFIX/bin/termix

> $ cp termix $PREFIX/bin/termix

4. termix初始化生成启动脚本与启动

> $ termix init && termix boot

# 注：

1. chroot-script需要在tsu模式下使用

2. 下次进入系统只需要在root目录下执行termix boot即可

3. 如果还是不懂可以加[Termux社](https://jq.qq.com/?_wv=1027&k=5IgZl4r)提问 :)

