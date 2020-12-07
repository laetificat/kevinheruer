+++
title = "Micropython"
date = "2020-12-07T19:13:05+01:00"
author = "Kevin"
cover = ""
tags = ["avr", "denon", "micropython", "iot"]
keywords = ["avr", "denon", "micropython", "iot"]
showFullContent = false
+++
Currently dabbling in MicroPython because I want to be able to control my Denon AVR with a "wireless" volume knob
which isn't a remote because I like the tactile response a volume knob gives.

Right now I am able to turn it on/off, turn the volume up/down, and switch input sources with my own controller library
I quickly wrote on a friday night. For testing I'm using an old car radio button which doesn't behave like a normal
rotary encoder it seems, wiring it up like a normal encoder will cause shorts in the system and trigger unwanted 
commands. I guess I'll have to wait for the rotary encoders I ordered from Ali.

It's a pretty quick and dirty project and still a work in progress but if you're interested you can check it here: https://github.com/laetificat/volume-knob