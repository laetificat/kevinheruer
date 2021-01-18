+++
title = "Proxmox Tip"
date = "2021-01-18T17:51:06+01:00"
author = "Kevin"
cover = ""
tags = ["proxmox", "pve", "infrastructure", "server"]
keywords = ["proxmox", "pve", "infrastructure", "server"]
description = ""
showFullContent = false
+++

When you're using Proxmox for free without any subscription you may see 
{{< code language="bash" >}}
TASK ERROR: command 'apt-get update' failed: exit code 100
{{< /code >}}
The issue here is that by default Proxmox is using subscription only repos, 
you can remove this "error" by either getting a subscription (duh), or change 
the repo to `pve-no-subscription`. This repo is not as stable as the subscription 
one they claim, but for a home server it should be enough. If you really need 
the stability you're probably running a critial environment which probably is 
worth paying for the subscription.

To change the repo edit your `/etc/apt/sources.list` and set the repo to 
`pve-no-subscription`.
{{< code language="bash" >}}
deb http://ftp.debian.org/debian buster main contrib
deb http://ftp.debian.org/debian buster-updates main contrib

# PVE pve-no-subscription repository provided by proxmox.com,
# NOT recommended for production use
deb http://download.proxmox.com/debian/pve buster pve-no-subscription

# security updates
deb http://security.debian.org/debian-security buster/updates main contrib
{{< /code >}}

Source: [https://pve.proxmox.com/wiki/Package_Repositories#sysadmin_no_subscription_repo](https://pve.proxmox.com/wiki/Package_Repositories#sysadmin_no_subscription_repo)