#!/bin/bash

WORKDIR=$(pwd)
source $WORKDIR/bin/functions.sh
CURIMG=$(current)

echo "Decrypting: $CURIMG"
decrypt $CURIMG.img
echo "Housekeeping..."
sudo rm -f $CURIMG.img.gpg
