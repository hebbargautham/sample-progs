#!/bin/bash

workdir=$1
mycpu=$2

pow=2
cpu=$((pow**mycpu))
echo "Workdir" $workdir "CPU" $cpu


./neg-dentry-silent-conf-fs.sh $workdir &

chldpid=$!
echo "chldpid" $chldpid

taskset -p $cpu $chldpid

