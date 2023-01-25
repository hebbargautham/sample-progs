#log.py
#displays log output
#Usamge: drgn -c <vmcore> -s <vmlinux> log.py
#Author: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>

import drgn
from drgn.helpers.linux import *

dmsgs = drgn.helpers.linux.printk.get_printk_records(prog)
for msg in dmsgs:
    print("[ ", msg.timestamp, " ]", msg.text.decode("utf-8"))
