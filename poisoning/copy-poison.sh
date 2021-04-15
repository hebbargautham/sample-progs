#!/bin/bash

skp=0
skpincr=1048576000
cnt=1001

for ((a=1;a<=cnt;a++)); do
	dd if=/mnt/gtmfile iflag=skip_bytes skip=$skp bs=1M count=1000 of=/dev/sdb seek=$skp
	skp=$((skp+skpincr))
	echo $skp
done
