+++
title = "Using the same dataset mounted on an app and share it via SMB"
date = "2023-07-28T01:00:00+01:00"
author = "Kevin"
cover = ""
tags = ["server", "storage", "truenas", "network sharing", "smb", "nfs", "apps"]
keywords = ["server", "storage", "truenas", "network sharing", "smb", "nfs", "apps"]
description = """
Unlock the power of dataset management and sharing through SMB with our comprehensive guide. Discover how to simultaneously mount a dataset and share it using SMB and NFS shares with TrueCharts. This blog post breaks down the complexities, offers insights into the 'why' behind this technique, and provides actionable steps to enhance your data workflow. Dive in to unlock more flexibility, control, and efficiency in your data management endeavors."""
showFullContent = false
+++

## The Efficacy of Mounting a Dataset and Sharing It via SMB Simultaneously

Discovering the intricacies of dataset management can sometimes seem like an overwhelming puzzle. But, after a lot of learning and tinkering, I’ve finally mastered a method to concurrently mount a dataset and share it via SMB.

### Why is This Important?

You might wonder, why go through all this trouble? Here’s my use case: I frequently upload videos to my Plex dataset, which is integrated with my Plex TrueNAS app. The conventional approach was to nest a dataset and mount the child dataset while concurrently sharing the parent dataset via SMB. This method, however, became nonviable following an update from TrueNAS.

Fortunately, it opened up two alternatives. The first is to [disable host path validation](/scale/scaletutorials/apps/appadvancedsettings/configuring-host-path-safety-checks/#using-shared-host-paths-with-safety-checks-disabled), while the second merges the strengths of NFS and SMB shares using TrueCharts.

### Why I Chose the Second Option

Given that I was already utilizing TrueCharts, the second option was more appealing. The process is simple: instead of the traditional host path, I employed the NFS option in the volume mount of the app. Prior to this change, it's essential to establish the NFS share.

This decision ensured that I could still manually upload videos to my Plex dataset without any disruption or the need for workarounds. By integrating NFS and SMB shares via TrueCharts, I created a more robust and efficient solution.

### Further Reading

If you're looking to do the same or just intrigued about this process, you can find more detailed information in this guide: [https://truecharts.org/manual/SCALE/guides/dataset](https://truecharts.org/manual/SCALE/guides/dataset). Diving into the world of dataset management might seem daunting, but with the right approach and resources, it can transform into a manageable task, and even an enjoyable one.

Understanding how to effectively manage datasets and sharing options can greatly enhance your system's functionality. It provides more flexibility and control over how your data is accessed and manipulated, leading to improved workflows and efficiencies. So, don't be afraid to explore the world of data management—it's an investment that's sure to pay off.
