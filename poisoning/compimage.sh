#!/bin/bash

uid="$1"
gtm="$2"
conv="$3"
dst=/xfs/gmananth/6b3711ae-3306-4bdd-823c-cf1c0060a095.conv.1
skp=0
skpincr=1048576000
cnt=24

for ((a=1;a<=cnt;a++)); do
	dd if=$uid iflag=skip_bytes skip=$skp bs=1M count=1000 | hexdump -C > /xfs/gmananth/$gtm/${conv}.$a
	dd if=$dst iflag=skip_bytes skip=$skp bs=1M count=1000 | hexdump -C > /xfs/gmananth/$gtm/good.$a
	diff /xfs/gmananth/$gtm/${conv}.$a /xfs/gmananth/$gtm/good.$a > /xfs/gmananth/$gtm/${conv}.$a-diff
	skp=$((skp+skpincr))
	difsz=`ls -l /xfs/gmananth/$gtm/${conv}.$a-diff | cut -d " " -f 5`
	echo $difsz
	echo $skp
	if [ $difsz -eq 0 ]
	then
		rm -f /xfs/gmananth/$gtm/${conv}.$a-diff
		rm -f /xfs/gmananth/$gtm/good.$a
		rm -f /xfs/gmananth/$gtm/${conv}.$a
	else
		echo "Diff found /xfs/gmananth/$gtm/${conv}.$a-diff"
		rm -f /xfs/gmananth/$gtm/good.$a
		rm -f /xfs/gmananth/$gtm/${conv}.$a
	fi
	
done
