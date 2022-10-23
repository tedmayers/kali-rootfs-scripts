#!/bin/bash

WORKDIR=$(pwd)
source $WORKDIR/bin/functions.sh
CURIMG=$(current)

echo "Encrypt: $CURIMG"
encrypt $CURIMG.img
echo "Housekeeping..."
sudo rm -f $CURIMG.img
