+++
title = "Alacritty"
date = "2020-12-21T11:52:35+01:00"
author = "Kevin"
cover = ""
tags = ["terminal", "alacritty", "software"]
keywords = ["terminal", "alacritty", "software"]
description = ""
showFullContent = false
+++
I've recently come across a new terminal emulator called [Alacritty](https://github.com/alacritty/alacritty), it is a new terminal emulator written in Rust.
It uses the GPU to accellerate the calculations it needs to make which results in a more responsive terminal, 
some commands like tree also seem to run faster.

Check out this video from DistroTube:
{{< youtube PZPMvTvUf1Y >}}

The terminal emulator is still in beta and does not have any GUI to edit the settings, all settings need to be 
defined in a YAML config file. It also does not (yet) have tab funcionality, you'll need to open a new window 
every time you want another terminal. Of course you could use something like [tmux](https://github.com/tmux/tmux) to work around that problem.
