---
title: "Changing Default Colours in Windows WSL Linux"
description: Changing the default WSL console colours.
date: 2021-11-02T16:41:12+11:00
draft: false
categories: 
    - "Linux"
tags: 
    - "WSL"
    - "Bash"
---

I am using the bash shell in Windows WSL Linux. Currently I am using the Ubuntu 20.04, Debian and OpenSuse distributions.

The problem I have is that the default colour scheme has an ugly green background colour with blue text

![Default colours](/images/default-colours.jpg "Default colours")

This is a really disconcerting colour scheme!

I looked around for an alternative colour scheme to use and found that I could run a command to change the colours manually but each time I opened the terminal I would have to run the command again.

A more permanent solution is to add the colour command into my ``.bashrc`` file.

The important point to note is that each version of Linux I am running has its own distribution so I have to add the following command to every ``.bashrc`` file.

{{< highlight bash >}}
	# Change ugly directory colours
	LS_COLORS="ow=01;36;40" && export LS_COLORS #WSL dir colors
{{< / highlight >}}

This the output I get when I now do a directory listing.

![New colours](/images/new-colours.jpg "New colours")

This is a better alternative to the default colours.
