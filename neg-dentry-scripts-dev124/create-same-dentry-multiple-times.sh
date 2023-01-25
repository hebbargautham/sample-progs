#!/bin/bash

testdir=/root/gmananth/watch/watch

#$1=negative_dentry_num
#$2=repeat_n_times
#$3= with-fix/without-fix

negative_dentry_num=$1
repeat_n_times=$2

create_negative_dentry()
{
local i=0
echo " "
echo `date` " Start iteration $2 to do negative dentry access"
for ((i=0; i<$1; i++)); do
test -f $testdir/$i-notexist
done
echo `date` " Test done, the dentry details from fs/dentry-state:"
cat /proc/sys/fs/dentry-state
}

echo `date` " Test: create-same-dentry-multiple-times perf test $3 on:" `uname -r`
echo "fs/dentry-state at the start:"
cat /proc/sys/fs/dentry-state
echo " "

if [ ! -d $testdir ]; then
mkdir -p $testdir
fi

for ((j=0; j<$repeat_n_times; j++)); do
time create_negative_dentry $negative_dentry_num $((j+1))
done
echo " "
