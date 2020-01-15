#!/bin/sh

export STALISRC=$(pwd)/stalibuild-root/src
export DESTDIR=$(pwd)/rootfs-x86_64

sudo apt-get install build-essential flex

mkdir stalibuild-root
cd stalibuild-root
git clone http://git.sta.li/toolchain
git clone http://git.sta.li/src
cd src
git clone http://git.sta.li/sys.x86_64

sed -i 's,^DESTDIR.*,DESTDIR     = '$DESTDIR',' config.mk
make && make install

cd ../..
sudo docker build -t stali .
