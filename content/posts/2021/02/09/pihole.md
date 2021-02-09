+++
title = "Pihole"
date = "2021-02-09T17:59:40+01:00"
author = "Kevin"
cover = ""
tags = ["Pi-hole", "AdBlock", "Networking"]
keywords = ["pihole", "pi-hole", "adblock", "ad block", "networking"]
description = ""
showFullContent = false
+++

# Pi-hole
What is it? It's a DNS level adblocker, this means running this on your network and  
setting Pi-hole as your DNS it will filter out ads for your whole network.

It's easy to set up using a Raspberry Pi for example, all you need is a Pi and an SD card. 
You should use BalenaEtcher to flash the OS, I recommend Raspberry Pi OS on a Pi for 
stability. But you can use any Linux based OS that utilizes systemd or sysvinit.

There is also a Docker image if you want to go that route. I'm currently running Pi-hole in 
a VM on my main server. You can follow the [installation instructions](https://docs.pi-hole.net/main/basic-install/) 
to install Pi-hole, following the documentation is pretty straight forward. However, I do 
recommend turning off any logging in the Pi-hole admin interface. Unless you want to log 
your network traffic of course!

Just note that Pi-hole does not work with YouTube and Facebook, this is because they serve 
their ads from their own domain. So any service serving ads from their own domain will get 
through because blocking that domain would mean you would'nt be able to browse it either. 
I also noticed that advertised results on Google search aren't removed either, the URL behind 
it is blocked but the fake search result still pops up.

I recommend to use Pi-hole as a general ad block and to install an extra adblock addon in your 
browser.

P.S. If any services start behaving weird, like IoT devices or even your TV. Try turning off Pi-hole 
and see if that fixes it. If that's the case turn on logging if you haven't already and check which 
URL is getting blocked that shouldn't and add it to your whitelist.
