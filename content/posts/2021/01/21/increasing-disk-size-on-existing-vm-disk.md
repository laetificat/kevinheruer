+++
title = "Increasing Disk Size on Existing VM Disk"
date = "2021-01-21T17:05:03+01:00"
author = "Kevin"
cover = ""
tags = ["proxmox", "vm", "infrastructure", "zfs", "server"]
keywords = ["proxmox", "vm", "infrastructure", "zfs", "server"]
description = """
When you're using your Proxmox server you might run in the problem of not having enough 
HDD space defined for some of your VMs, using ZFS (pools) it's really easy to fix this.
"""
showFullContent = false
+++

When you're using your Proxmox server you might run in the problem of not having enough 
HDD space defined for some of your VMs, using ZFS (pools) it's really easy to fix this.

Since all my VM disks are simple files you can easily increase their size by running 
the following command:
{{< code language="bash" >}}
qm resize <vmid> <disk> <size> 
{{< /code >}}

Let's say you have a VM with a disk named vm-100-disk-0 and you wan to increase the disk 
size by 100GB, you just run
{{< code language="bash" >}}
qm resize 100 vm-100-disk-0 +100G
{{< /code >}}
and you're halfway there!

Now you need to tell the VM to use the newly added space, first you need to check if 
the system sees the new space by running
{{< code language="bash" >}}
dmesg | grep sda
{{< /code >}}

Now we need the right partition to add the space to, run the following to check which 
partitions there are
{{< code language="bash" >}}
fdisk -l /dev/sda | grep ^/dev
{{< /code >}}
Remember the number /dev/sda3 for example would be 3.  
(Just make sure you're grepping the right device, vda is also a possibility.)

Now run pared with the right device
{{< code language="bash" >}}
parted /dev/sda
{{< /code >}}

It will ask you to fix the unused space, enter `F` for fix, then run
{{< code language="bash" >}}
resizepart 3 100%
{{< /code >}}
This will resize partition (sda)3 to use 100% of the newly added space.

That's it, no need to reboot!

You can find a more detailed description at the source: https://pve.proxmox.com/wiki/Resize_disks