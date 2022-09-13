+++
title = "Migrating from Proxmox VE to TrueNAS Scale"
date = "2022-09-13T19:30:00+01:00"
author = "Kevin"
cover = ""
tags = ["proxmox", "ve", "truenas", "infrastructure", "migration", "migrate", "hosting"]
keywords = ["proxmox", "ve", "truenas", "infrastructure", "migration", "migrate", "hosting"]
description = "Why I chose to migrate from Proxmox to TrueNAS Scale"
showFullContent = false
+++
I've been using Proxmox VE for over a year now, ever since I built the new 
server. However, I started to run into limitations mainly because 
Proxmox VE is not the right tool for my situation. I always thought I 
needed the flexibility off full blown VM's and that the storage side of 
things came after, I have been proven wrong.

I like to keep things separated, this means that I have over 15 VM's 
running and most of them are just simple services like a load balancer 
or a dashboard. Running full VM's for this is overkill and has a huge 
impact on the server's resources, including storage. Because they're 
all VM's they need a boot disk and some storage, the default for a 
simple Debian server is around 10 to 20GB which is not fully utilised.

Also, most of the work and usage is storage. Nextcloud and Plex are the 
biggest services running on the server, but far from being the most 
critical. Home Assistant is _the_ most important service running right 
now which controls everything in the house.

Knowing this, the idea is to move to TrueNAS Scale. Mainly because 
TrueNAS is focused on storage rather than being a Virtual Machine first 
approach. Especially now containerization is the norm, even in enterprise 
environments.

I do know that Proxmox VE has the option to run LXC, but with LXC being 
the less popular its safer to go for TrueNAS scale which implements 
Kubernetes. Plus TrueNAS has the whole storage first approach, which for 
me is the better option because reliable storage (and more user friendly interface) 
has become more important for me than flexibility in running environments.

I will still recommend Proxmox VE to people who need full control over 
their VM's, it's especially good for running multiple full blown 
desktops with remote login (think thin clients etc).