#!/bin/bash

testdir=/root/gmananth/neg/conv-pos

#$1=negative_dentry_num
#$2= with-fix/without-fix

negative_dentry_num=$1
dir_needed=1

remainder=1
remainder=`expr $negative_dentry_num % 1000`

if [ $remainder -gt 0 ]
then
	echo "Please create multiples of 1000 dentries/files"
	exit 1
fi

if [ $negative_dentry_num -gt 1000 ]
then
	dir_needed=`expr $negative_dentry_num / 1000`
fi


create_dir_tree()
{
local i=0
local j=0
for((i=0; i<$1; i++)); do
mkdir $testdir/$i
done
}

create_negative_dentry()
{
local i=0
echo `date` " Start to do negative dentry access"
for ((i=0; i<$1; i++)); do
for ((j=0; j<$2; j++)); do
test -f $testdir/$i/$j-notexist
done
done
echo `date` " Done creating negative dentries, the dentry details from fs/dentry-state:"
cat /proc/sys/fs/dentry-state
}

create_files()
{
local i=0
local j=0
echo " "
echo `date` " Start creating $1*$2 files"
for((i=0; i<$1; i++)); do
for ((j=0; j<$2; j++)); do
touch $testdir/$i/$j-notexist
done
done
echo `date` " Done creating files, the dentry details from fs/dentry-state:"
cat /proc/sys/fs/dentry-state
}

echo `date` " Test: create-negative-dentry-touch-same-files perf test $2 on:" `uname -r`
echo "fs/dentry-state at the start:"
cat /proc/sys/fs/dentry-state
echo " "

if [ ! -d $testdir ]; then
mkdir -p $testdir
fi

create_dir_tree $dir_needed
echo " "
time create_negative_dentry $dir_needed 1000
echo " "
time create_files $dir_needed 1000

echo " "
echo " "
echo `date` " Tests done. Removing $dir_needed*1000 files"
time rm -rf $testdir/*
echo " "
echo `date` " The dentry details at the end of tests from fs/dentry-state:"
cat /proc/sys/fs/dentry-state
echo " "
