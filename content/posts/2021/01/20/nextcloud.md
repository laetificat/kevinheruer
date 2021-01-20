+++
title = "Nextcloud"
date = "2021-01-20T10:23:09+01:00"
author = "Kevin"
cover = ""
tags = ["nextcloud", "infrastructure", "server"]
keywords = ["nextcloud", "infrastructure", "server"]
description = ""
showFullContent = false
+++

# What is Nextcloud
Nextcloud is a complete software package to replace most cloud services 
like Google, iCloud, Dropbox etc. Nextcloud is branched off from the other 
solution ownCloud because (from what I've heard) a couple of devs did not 
like the direction it was going so they started their own product.

Nextcloud is not just a storage solution, it's a complete package, it's not 
blazingly fast and it's written in PHP. But it does offer great integration 
with other services and has tons of plugins, there are plugins for monitoring 
your Nextcloud instance itself or third party services. It also supports contacts, 
calendars, Kanban boards, and even complete chat integrations with video.

# Why Nextcloud
I mainly use Nextcloud as a Google Drive/Dropbox replacement, but the expandability 
is what really got me. I'm pretty sure I want more functionality in the future so 
using a different service like Seafile is not what I'm looking for in the long run, 
plus Nextcloud being completely free to host yourself without limitations is great.

A simple Samba/WebDAV was not going to cut it either, having a nice web interface is 
important since having to install some app to use it sucks and sometimes I work on 
public systems and having to connect to SMB/WebDAV is just not doable while opening 
a webpage is easy.

It also has apps, like for iOS, I recently moved all my photos from iCloud to my Nextcloud 
instance and with the auto upload feature I won't have to worry about missing any photo's 
or videos missing from my Nextcloud environment.

Just owning your own data is great, I'm 99% sure Apple won't do any crazy things with my 
data, but you never know. Plus I don't need to pay a montly fee to get more storage, a 
HDD is really cheap these days and already having a server certainly did help.

# How to set it up
You can set up Nextcloud in multiple ways, I went with the manual one because I want to 
squeeze/optimize every little thing to save resources on my hardware.

I basically followed the documentation for installation on Linux here: 
https://docs.nextcloud.com/server/20/admin_manual/installation/source_installation.html 
I installed every required PHP module (and PHP itself) together with MariaDB, Redis, and SMB.

It's recommended to install imagick, apcu, memcached, and redis module for PHP so you don't 
run into any performance issues down the road. You could also always install these at a later 
moment when you DO run into these performance issues ofcourse. 

Instead of following the Apache configuration I followed the Nginx one: 
https://docs.nextcloud.com/server/20/admin_manual/installation/nginx.html 
just because I'm more familiar with Nginx and I personally think it's less resource hungry and 
faster. I changed some default things like `client_max_body_size` to 10G and ofcourse the 
server_name.

Instead of using SQLite I use MariaDB, it's much faster and stable for long term use, Nextcloud 
also only recommends SQLite for development environments.

# Optimization
Make sure to read https://docs.nextcloud.com/server/20/admin_manual/installation/server_tuning.html 
a lot of points here lead to a smooth server, I still need to optimize some things like PHP-FPM 
but at least make sure you're using MariaDB/MySQL and Redis caching. These two will speed up 
things by a lot. 

Next check out https://docs.nextcloud.com/server/20/admin_manual/configuration_server/caching_configuration.html 
it will explain/suggest the best caching settings for your Nextcloud instance. Remember PHP 
runs best when properly cached/optimized. Just running PHP and PHP-FPM with default settings is 
just OK, and that's not good enough for most in production.

At last, if you're seriously thinking about using Nextcloud as your main cloud storage/Dropbox replacement 
make sure you check out https://docs.nextcloud.com/server/20/admin_manual/installation/harden_server.html 
and be sure to run over HTTPS.

Oh and run in RAID1 or ZFS Mirror, I advise using ZFS even though it uses more RAM it's worth it. 
Being able to have a pool you can modify however you want and having an abstract layer around 
your hardware is great and (in theory) I won't lose any data if any (1) HDD fails in a mirror. 
Just don't run striped RAIDs even when the 80% usable capacity is so tempting.

PS. redundancy isn't a backup, make sure you have one. :)

PPS. this runs in a VM with 3GB of RAM and an intel i5 10500.