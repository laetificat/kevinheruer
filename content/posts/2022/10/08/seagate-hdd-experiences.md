+++
title = "Seagate Skyhawk Drives suck!"
date = "2022-10-08T20:00:00+01:00"
author = "Kevin"
cover = ""
tags = ["hdd", "seagate", "skyhawk", "harddrive", "drive", "server", "storage"]
keywords = ["hdd", "seagate", "skyhawk", "harddrive", "drive", "server", "storage"]
description = "I had to replace multiple drives within 2 years"
showFullContent = false
+++
The Seagate Skyhawk drives are advertised as "surveillance" drives, 
this basically means that its made for lots of write actions.

But let me give you some backstory, I currently run a TrueNAS Scale 
server with 8TB in total in one pool split among 3 mirrored vdevs. 
2 of these vdevs are 2 mirrored 2TB Skyhawks, the other and most 
recent one is a 4TB mirrored Toshiba vdev.

In a timespan of 2 years this server has run (1.5 years on Proxmox), 
I had to replace 3 Seagate drives. 1 2TB and both the 4TB ones. I 
know these drives arent made for read/write but still, they tend do 
die pretty quick with my setup. And the temperatures arent extremely 
high either.

I'll be testing the Toshiba 4TB drives to see if they keep up better 
since these are advertised as NAS drives.

So at the bottom line, I do NOT recommend Seagate Skyhawk drives as 
a cheap option for your server, get something else that's a bit more 
expensive instead. It'll be cheaper in the end ;)

P.S. The drives were advertised as 7200 RPM at tweakers.net but in 
reality they're 5400 RPM. The drives in queston are the ST4000VX013 
models. Turns out I had to do some more research before buying, but 
they are the cheapest (at time of writing).
