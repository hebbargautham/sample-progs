#!/bin/bash

thispid=$$

mycpu=1

echo $mycpu
echo $thispid
numthreads=$1
maxcpu=$2
mycpu=1
loopcnt=0

for ((j=0; j<$numthreads; j++)); do
mycpu=$((mycpu * 2))
loopcnt=$((loopcnt + 1))
if [ $loopcnt -eq $maxcpu ]; then
echo "Loop count reached max"
mycpu=1
loopcnt=0
fi

sleep 1
done

while [ 1 ]; do sleep 3; done
