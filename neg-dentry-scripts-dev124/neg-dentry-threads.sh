#!/bin/bash

numthreads=$1
maxcpu=$2

mycpu=1
loopcnt=0

for ((j=0; j<$numthreads; j++)); do

if [ $j -ne 0 ]; then
mycpu=$((mycpu * 2))
fi

loopcnt=$((loopcnt + 1))

./neg-dentry-silent-conf.sh &

chldpid=$!
echo "chldpid" $chldpid

taskset -p $mycpu $chldpid

if [ $loopcnt -eq $maxcpu ]; then
echo "Loop count reached max cpu num resetting."
mycpu=1
loopcnt=0
fi

sleep 1
done



while [ 1 ] ; do sleep 3600; done
