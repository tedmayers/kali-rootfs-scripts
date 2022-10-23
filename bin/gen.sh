#!/bin/bash

IMGSTR=$(echo $RANDOM | md5sum | head -c 20; echo)
ARCH="amd64"
WORKDIR=$(pwd)
source $WORKDIR/bin/functions.sh

echo "Generating: KLM$IMGSTR ($1 GB)"
dd if=/dev/zero of=KLM$IMGSTR.img bs=1024M count=$1
echo "MakeEXT4: KLM$IMGSTR"
mkfs.ext4 -F -L root KLM$IMGSTR.img
echo "Mount: KLM$IMGSTR"
mkdir -p KLM$IMGSTR
sudo mount -o loop KLM$IMGSTR.img KLM$IMGSTR
echo "Bootstrap: KLM$IMGSTR.img"
sudo debootstrap --foreign --arch amd64 kali-rolling KLM$IMGSTR http://http.kali.org/kali
run-as-chroot KLM$IMGSTR "/bin/apt install -y kali-defaults kali-archive-keyring"
echo "Umount: KLM$IMGSTR.img"
sudo umount -l KLM$IMGSTR
sudo rm -rf KLM$IMGSTR
echo "Current: KLM$IMGSTR"
write-current "KLM$IMGSTR"
