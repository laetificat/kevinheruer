+++
title = "Running Spotify From a Terminal"
date = "2020-12-24T09:36:34+01:00"
author = "Kevin"
cover = "posts/2020/12/24/images/preview.gif"
tags = ["spotify", "spotifyd", "spotify-tui", "terminal", "software"]
keywords = ["spotify", "spotifyd", "spotify-tui", "terminal", "software"]
description = ""
showFullContent = false
+++
This post exist of two different projects, the first one is [Spotify-tui](https://github.com/Rigellute/spotify-tui), 
and de second is [Spotifyd](https://github.com/Spotifyd/spotifyd).

## Spotify-tui
Spotify-tui is a terminal interface using the web API and is witten in the Rust language, however, it does not play 
the songs itself. It only uses the API to select/play a song, you'll need another piece of the puzzle to actually 
play the music.

Since Spotify-tui is written in Rust it's very memory efficient and [safe](https://doc.rust-lang.org/nomicon/meet-safe-and-unsafe.html), 
meaning it will never do unexpected things. Running Spotify-tui it only uses 16MB of RAM and it has been running for 11+ hours.

You may argue that 16MB of RAM is a lot, but in the world of applications and even command line applications running on JavaScript it's a 
godsend. Spotify itself is around 200MB.

## Spotifyd
The other part of the puzzle is Spotifyd, a Spotify daemon written in Rust. It's a tiny Spotify client using only around 8MB of RAM. 
However, Spotifyd is not just specifically for Spotify-tui, it's a generic daemon. You could also use your Spotify app and stream it 
to the daemon using the device list in the app. 

This means you could create your own smart speaker for cheap! Or you could hook up a raspberry pi zero to your old sound system and 
give your old system new streaming functionalities.
