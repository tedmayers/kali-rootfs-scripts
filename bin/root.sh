#!/bin/bash

WORKDIR=$(pwd)
source $WORKDIR/bin/functions.sh
CURIMG=$(current)
echo "MDIR: $CURIMG"
mkdir -p $CURIMG
echo "Entering: $CURIMG.img"
run-as-chroot $CURIMG "/bin/bash --login"
echo "Cleaning: $CURIMG"
sudo umount -l $CURIMG
sudo rm -rf $CURIMG
