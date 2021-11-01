---
title: "My Internet Stopped Working"
description: My Internet stopped working.
date: 2020-05-01T16:23:48+10:00
draft: false
categories: 
  - "Programming"
tags:
  - "Computer"
---

I was working on my computer today when I needed to search for a topic on Google. To my surprise the internet had stopped working. I quickly checked on another device and found that the internet was working there.

It was just my computer with the problem.

I have had this problem in the past and use ``ipconfig`` to fix it.

The commands are:

{{< highlight bash >}}
  ipconfig /registerdns
  ipconfig /release
  ipconfig /renew
{{< / highlight >}}

The part that I always forget to do is reboot my computer after I do the *renew*. If you don't do this it doesn't work!
