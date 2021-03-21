+++
title = "Follow up on increasing existing VM disk size"
date = "2021-03-21T13:47:57+01:00"
author = "Kevin"
cover = ""
tags = ["vm", "storage", "server", "infrastructure", "proxmox"]
keywords = ["vm", "storage", "server", "infrastructure", "proxmox"]
description = "A little follow up on this post: [Increasing Disk Size on Existing VM Disk](/posts/2021/01/21/increasing-disk-size-on-existing-vm-disk)"
showFullContent = false
+++
A little follow up on this post: [Increasing Disk Size on Existing VM Disk](/posts/2021/01/21/increasing-disk-size-on-existing-vm-disk)

When extending an LVM system you should also run the following commands:

`pvresize /dev/sda3` (replace with your partition)

`lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv` (replace with your lvm partition)

`resize2fs /dev/mapper/dev/ubuntu--vg-ubuntu--lv` (again replace with your lvm partition)
