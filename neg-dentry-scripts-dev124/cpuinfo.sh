#!/bin/bash
#echo 2 > /proc/sys/vm/drop_caches
while [ 1 ] ; do mpstat -P ALL >> mpstat-P-ALL ; sleep 1 ; done
