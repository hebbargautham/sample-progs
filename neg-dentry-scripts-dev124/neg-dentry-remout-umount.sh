#!/bin/bash

declare -a arr=("/mnt/fs1" "/mnt/fs2" "/mnt/fs3" "/mnt/fs4" "/mnt/fs5" "/mnt/fs6" "/mnt/fs7" "/mnt/fs8" "/mnt/fs9" "/mnt/fs10")

while [ 1 ]
do
	for i in "${arr[@]}"
	do
		curdev=`sudo mount | grep -w $i | cut -d " " -f 1`
		echo "The device" $curdev "mounted at" $i
		echo "Unmounting" $curdev
		sudo umount $curdev
		sleep 1
	done
	sleep 100
done
