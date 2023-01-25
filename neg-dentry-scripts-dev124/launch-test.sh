#!/bin/bash

./neg-dentry-threads-bind-cpu.sh /mnt/fs1/work 0
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs2/work 1
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs3/work 2
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs4/work 3
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs5/work 4
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs6/work 5
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs7/work 6
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs8/work 7
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs9/work 8
sleep 1
./neg-dentry-threads-bind-cpu.sh /mnt/fs10/work 9
