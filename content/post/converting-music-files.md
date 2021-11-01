---
title: "Converting Music Files"
description: Converting .ISO music files to Flac format.
date: 2019-10-20T11:10:33+10:00
draft: false
tags: 
    - "FLAC"
categories: 
    - "Music"
---

I have been searching for a musical holy grail for a number of years (well what I would call a holy grail). Converting music files from one format to another is something I have been doing for years but I have always had trouble reformatting ``.iso`` files into high quality FLAC files.

I recently downloaded a Thelonious Monk album in ``.iso`` format and tried to load it into *Foobar 2000*, my music player of choice. It wouldn't play so I did a search for ``.iso`` to Flac converters. The first thing I found was a way to play ``.iso`` files in *Foobar 2000*. There are a couple of Foobar components that can be downloaded from Sourceforge that will allow me to play ``.iso`` files.

[Sourceforge.net](https://sourceforge.net/projects/sacddecoder/files/foo_dsd_asio/)

I installed the two components, **foo_input_sacd.fb2k** and **foo_dsd_processor.fb2k** and was able to play my ``.iso`` file in Foobar. I am also able to convert the individual ``.iso`` tracks into Flack format and got really excited until I realised they were only 44 Mhz tracks, not the 88 Mhz SACD format files.

I could stop right there and be happy that I can play ``.iso`` files but there is a hard disk hit with the size of the ``.iso`` file at 1.8 Gb which brings me back to why I want to compress the tracks to high quality compressed Flac files.

Some more reading had me downloading another open source utility named **Sonore**, a Java based GUI that converts the ``.iso`` file into individual Phillips format ``DDISDFF`` tracks. It is nice to create individual tracks that can also be played in Foobar but once again I am hit with 1.8 Gb of files.

This is the Sonore interface with the settings I use to create ``.dff`` files:

![Sonore GUI](/images/sonore.jpg "Sonore GUI")

I have found one method of converting from ``.dff`` to high quality Flac that works really well but unfortunately it is not freeware and is priced at $116 US and that is too much in my book.

I am back a square one with no method of converting to Flac but at least I can play ``.iso`` files in Foobar for the time being.

