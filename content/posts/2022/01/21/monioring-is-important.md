+++
title = "Monitoring is important"
date = "2022-01-21T21:00:00+01:00"
author = "Kevin"
cover = ""
tags = ["monitoring", "zabbix", "proxmox", "vm"]
keywords = "monitoring", "zabbix", "proxmox", "vm"]
description = "I was shocked to find out what really happens behind the scenes"
showFullContent = false
+++
I've been experimenting with monitoring systems because I was not satisfied with 
Proxmox's limited reporting of system stats. But that was not the only reason 
I set up a monitoring system.

I stumbled upon SNMP (Simple Network Management Protocol) and found it it's 
implemented in anything that has a network connection, it's even implemented 
in printers and routers. This protocol lets you fetch (and set) a limited set of 
data, but this is enough for monitoring. At first I set up Observium, it's a valid 
system but I quickly ran in the problem that it doesn't play nice with mDNS for 
some reason. I also have not set up an enterprice grade network so I do not have 
a local DNS server. I do not want to hack into hosts files or use IP addresses 
even though all non-user systems have static IP addresses.

Next was Zabbix, it's open source and very mature software. Setting it up 
(correctly) was quite a lot of work, and the learning curve is a bit steep if you 
never really used complete monitoring systems before. However, once Zabbix was 
set up and using the built-in templates it's quite easy to start monitoring a 
server.

Currently I have 11 servers running in VM on Proxmox, adding a server to Zabbix 
is as easy as `apt install zabbix-agent` and adding an IP range into the config. 
The most work I had to do for a server was getting the source and building it 
myself which was unnecessary because I had to restore the backup anyway 
(long story short: I upgraded the OS, it got borked).

Once I started adding my hosts I noticed that I was getting long disk write wait's, 
this could mean a lot of things. Including failing drives. I ignored it mostly and 
continued adding all the servers, once that was done I saw more servers throwing 
this error. I started investigating and found out there were 2 servers running 
MySQL/MariaDB database servers for the applications running on the servers, turns 
out that database servers love to read and write (duh). They were slamming the cheap 
HDD's I'm running in the server which they didn't like, I optimized the configs for 
the databases and now most is well.

[{{< figure src="/posts/2022/01/21/images/mysql_config_tweak.png" title="map" >}}](/posts/2022/01/21/images/mysql_config_tweak_full.png)

I did notice an increase in server/VM responsiveness but the warning(s) still remain, 
however looking at the graph it does show a great improvement and it currently just 
barely triggers the warning each time. I'm thinking of increasing the check for now 
and see if I can upgrade the HDD's in the future.

Another thing I noticed was that running a DB from an SSD really makes a difference:

[{{< figure src="/posts/2022/01/21/images/migration.png" title="map" >}}](/posts/2022/01/21/images/migration_full.png)

It's obvious SSDs are fast, but seeing a direct impact is really cool! I suggest you 
start setting up a monitoring system if you have any interest, the things you can 
do with the data is amazing. I might even connect Home Assistant to Zabbix so I have 
a single dashboard for all the data.