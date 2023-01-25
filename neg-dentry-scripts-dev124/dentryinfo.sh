#!/bin/bash
#echo 2 > /proc/sys/vm/drop_caches
while [ 1 ] ; do cat /proc/sys/fs/dentry-state >> num-neg-dentries ; sleep 15 ; done
