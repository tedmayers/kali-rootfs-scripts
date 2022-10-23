#!/bin/bash

WORKDIR=$(pwd)
source $WORKDIR/bin/functions.sh
CURIMG=$(current)

echo "Housekeeping..."
if [ -d $CURIMG ]
then
echo "Housekeeping... $CURIMG"
sudo umount -l $CURIMG
sudo rm -rf $CURIMG
fi

if [ -f $CURIMG.img ]
then
echo "Housekeeping... $CURIMG.img"
sudo rm -f $CURIMG.img
fi

if [ -f $CURIMG.img.gpg ]
then
echo "Housekeeping... $CURIMG.img.gpg"
sudo rm -f $CURIMG.img.gpg
fi

echo "Housekeeping... current.txt"
delete-current

echo "Done."
