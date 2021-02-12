+++
title = "Dualbooting Windows With Linux and WiFi"
date = "2021-02-10T19:13:57+01:00"
author = "Kevin"
cover = ""
tags = ["Windows", "Fast Boot", "Linux", "Dual Boot", "WiFi", "Arch Linux"]
keywords = ["Windows", "Fast Boot", "Linux", "Dual Boot", "WiFi", "Arch Linux"]
description = ""
showFullContent = false
+++

Today I ran into a problem that seems to have annoyed a lot of people, so I'm just 
posting it here to spread the word (and maybe for future me to reference back to).

The problem is that when you dual boot Windows and Linux, the chance exists that Windows 
used Fast Boot. Fast Boot causes the system to keep things like WiFi cards to itself so 
Linux can't access it and just says it can't find it.

This causes a lot of headaches for people, including me. So finally after I found the fix 
I decided to write up this blogpost. And to be honest, I should have known this since I 
[read the wiki when installing Arch.](https://wiki.archlinux.org/index.php/Dual_boot_with_Windows#Windows_settings)

So at the end of the day, DISABLE WINDOWS FAST BOOT.