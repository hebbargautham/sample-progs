#mount.py
#displays mount output
#Usamge: drgn -c <vmcore> -s <vmlinux> mount.py
#Author: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>

import drgn
from drgn.helpers.linux import *

mounts = prog['init_task'].nsproxy.mnt_ns
print("\nDEVNAME DIRNAME TYPE\n")

for mnt in drgn.helpers.linux.fs.for_each_mount(mounts):
    devname = mnt.mnt_devname
    fstype = mnt.mnt.mnt_sb.s_type.name
    mntpt = drgn.helpers.linux.fs.d_path(mnt.mnt.address_of_(), mnt.mnt_mountpoint)
    print(devname.string_().decode("utf-8"), mntpt.decode("utf-8"), fstype.string_().decode("utf-8"))

