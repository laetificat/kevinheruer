+++
title = "Increasing VM disk size: Final edition"
date = "2021-07-23T21:47:00+01:00"
author = "Kevin"
cover = ""
tags = ["vm", "storage", "server", "infrastructure", "proxmox"]
keywords = ["vm", "storage", "server", "infrastructure", "proxmox"]
description = "The final edition of increasing your Ubuntu VM LVM disk space"
showFullContent = false
+++
This post merges both [A little follow up on this post](/posts/2021/01/21/increasing-disk-size-on-existing-vm-disk) and [Increasing Disk Size on Existing VM](/posts/2021/01/21/increasing-disk-size-on-existing-vm-disk) 
and fixes a couple of mistakes.

First off, go to your Proxmox host. Run the resize command:
{{< code language="bash" >}}
qm resize <vmid> <disk> <size> 
{{< /code >}}
where `vmid` is the ID in your VM ID, `disk` is the identifier of the disk inside the VM, it's most likely to be `scsi0`. 
`size` is the size you want to add or remove, something like `+100G` or `+1T` is both valid.

Now go into your VM, run the following command to check if the system has notices a disk resize:
{{< code language="bash" >}}
dmesg | grep sda
{{< /code >}}
Where `sda` is the disk, it could be vda or sdb.

Run the following command to get your disk and display the partitions, remember to change `sda` if required.
{{< code language="bash" >}}
fdisk -l /dev/sda | grep ^/dev
{{< /code >}}
Remember the number of the partition you want to increase, it's most likely the biggest one.

Run the following command to open parted with the drive:
{{< code language="bash" >}}
parted /dev/sda
{{< /code >}}

Run a `list` to check if everything is recognized correctly and run the following command:
{{< code language="bash" >}}
resizepart <partition number, integer only> 100%
{{< /code >}}
You could change the 100% to add only a percentage of the free space and add the remaining 
space to another partition, but to keep it simple we'll give it all to this partition.

If it asks to fix the unused space type `F` to fix it, if it asks for a partition number and 
size; just put in the values like above.

Ctrl-C out of Parted and run `df -h`, you'll notice that you still do not have your extra space!
Run `pvresize /dev/<block>` to start resizing, remember to subsitute `<block>` with your partition 
like `sda3`.

Now run `lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv` and `resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv` 
to actually resize your LVM partition. Remember to replace `/dev/mapper/ubuntu--vg-ubuntu--lv` 
with your LVM partition, you can find it by running `df -h` and looking for the one mounted on `/`.

That's it! The drive has been expanded and readily available, no need to reboot!

Sources:  
[https://pve.proxmox.com/wiki/Resize_disks](https://pve.proxmox.com/wiki/Resize_disks)