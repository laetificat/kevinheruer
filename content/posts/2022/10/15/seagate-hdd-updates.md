+++
title = "Seagate Skyhawk Drives suck! Part 2"
date = "2022-10-15T01:00:00+01:00"
author = "Kevin"
cover = ""
tags = ["hdd", "seagate", "skyhawk", "harddrive", "drive", "server", "storage"]
keywords = ["hdd", "seagate", "skyhawk", "harddrive", "drive", "server", "storage"]
description = "Maybe they don't suck?"
showFullContent = false
+++
Last post was about the Seagate Skyhawk HDDs and how they seemed 
to die like flies. I replaced them with some Toshibas (which are noisier btw) 
but I wanted to be 100% sure if they were actually dying, so I 
put them in an external HDD caddy and read out the S.M.A.R.T values. 
Turns out there is nothing wrong with them??? I also used CrystalDiskInfo 
and CrystalDiskMark and they seem to be fine.

So the next thing on the list is the RAM, it's possible the RAM is faulty 
and makes the system do unexpected things. They are non ECC because 
I'm running consumer grade hardware but that shouldn't be the issue, 
so now I loaded half of the sticks into my desktop and I'm running 
MemTest86 to see if I can find anything.

So now I have 3x 4TB drives extra, I can't put them back into the 
system because they're 5700RPM instead of the 7200 the others are 
running on. An alternative for them would be to use them as backup 
drives, I still have an old 2-bay Synology NAS and backing up the critical 
stuff shoulnd't be even close to 4TB making it perfect to run them in 
mirror.
