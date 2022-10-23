#!/bin/bash

function run-as-chroot
{
	sudo mount -o loop $1.img $1
	sudo mount --bind /dev $1/dev
	sudo mount --bind /proc $1/proc
	sudo mount --bind /tmp $1/tmp
	sudo chroot $1 $2
	sudo umount $1/dev
	sudo umount $1/proc
	sudo umount $1/tmp
	sudo umount $1
}

function encrypt
{
	gpg -c $1
}

function decrypt
{
	gpg -d $1.gpg
}

function write-current
{
	touch current.txt
	echo $1 > current.txt
}

function current
{
	if [ -f current.txt ]
	then
		echo $(cat current.txt)
	else
		exit 0
	fi
}

function delete-current
{
	if [ -f current.txt ]
	then
		sudo rm -rf current.txt
	else
		exit 0
	fi
}

