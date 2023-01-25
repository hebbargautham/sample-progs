#!/bin/bash

testdir=$1
mypid=$$
echo "Workdir" $testdir

# $1=negative_dentry_num
create_negative_dentry()
{
local i=0
local thistime=`date -I'seconds'`
echo `date` "start $! to do negative dentry access"
for ((i=0; i<$1; i++)); do
test -f $testdir/$mypid-$i-$thistime-notexist
done
echo `date` " Test done"
}

echo `date` " Test: negative dentry limitation perf test"
if [ ! -d $testdir ]; then
mkdir -p $testdir
fi

while [ 1 ] ; do create_negative_dentry 100000; done
