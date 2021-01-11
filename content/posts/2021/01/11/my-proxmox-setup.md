+++
title = "My Proxmox Setup"
date = "2021-01-11T11:39:26+01:00"
author = "Kevin"
cover = ""
tags = ["server", "proxmox", "VM"]
keywords = ["server", "proxmox", "VM"]
description = ""
showFullContent = false
+++

Proxmox VE is an interface for managing virtual machines and containers, 
it's a lightweight solution that _could_ run from ram/usb stick. 
Proxmox has more solutions like backup and email etc. but I only use the VE 
software. It's free and open-source, is production ready, and is being worked 
on actively.

With Proxmox VE you can setup VMs on machines and also cluster multiple machines 
together, it's easy to use (if you know how to use it) and fast. Currenly I am 
running 6 VMs on my server, most of them still need some work done but all of 
them are running Ubuntu Server 20.04.

Proxmox VE also supports hardware passthrough for when a VM needs it, in my case 
I use it for Plex to use the GPU for transcoding.

Storage management is also easy to do in Proxmox, however when building a server 
always calculate how much storage you thing you need and then double that. I am 
currently running into the issue that I'm running out of storage, mainly because 
I am running in ZFS mirror (RAID1) and cuts my storage in half. Thankfully storage 
is not terribly expensive, unless you need multiple tens of TB.

There are alternatives to Proxmox VE and it all comes down to your preference, the 
reason I'm using Proxmox is because it made sense the first time I saw it. It does 
not have a flashy UI but it works and everything is where it's supposed to be. 
But I might change my mind in the future and start using unRAID, who knows.
