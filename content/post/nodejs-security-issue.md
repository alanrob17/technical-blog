---
title: "Node.js Security Issue"
description: Security problems using Node.js.
date: 2020-06-29T17:35:08+10:00
draft: false
categories:
    - "Programming"
tags:
    - "Computer"
    - "Node"
    - "Security"
---

Yesterday morning I opened my computer and noticed that I had a Window 10 feature update waiting to be installed. I completed the process and started working on the Rest API that I am creating. I am using Node.js and running my server with Express.js.

I booted up the server and immediately got a server error. I had worked on the application the day before and knew that it was running without any problems. Not long after my PC froze and I had to reboot. Surprisingly when I restarted the computer the application started working again and I was able to work through the day.

Today I booted my application up again and started working. After the first save the server fell over again with the following error.

> EACCES: permission denied 0.0.0.0:3000

This was the same error I had yesterday. I removed the code I was working on and restarted the server but still had the same error. I stopped this application and ran another Node.js application that I had previously completed and it wouldn't boot up as well.

I was perplexed at the IP address I was seeing as it was supposed to be running on 127.0.0.1 (localhost). I searched through Google to find that there were a lot of references to EACCES but none of them seemed to be related to the issue I was having. Somebody suggested rebooting my computer so I tried this out and started my application again. This time a dialog box appeared on my screen that gave me a message that I could work with.

![Windows Defender security alert](/images/defender.jpg "Windows Defender security alert")

The interesting thing is that I don't have Windows Defender firewall installed on my machine and use another firewall. I have never seen this message before and assume that this is part of the Windows update that I had completed. I "allowed access" and have been able to work with no issues.

I decided to do a check to see if I could find some more information about what caused the change to my machine. In the security settings I found the following setting that probably caused the security issue that I was given.

![Windows Defender app and Browser security](/images/app-security.jpg "Windows Defender app and Browser security")

I am not relying on Windows Defender to protect my computer. I prefer my own Internet Security package to do that so if I have any more problems with permissions stopping my projects from working I will turn this setting off to see if it is causing my security issues.

I find this frustrating because there are a huge number of developers who have been building applications with Node.js for a number of years so why they are treating this package as an 'unrecognized app' is beyond me.

I also noticed that all of the Postman API requests that I had created to test my application had stopped working. The Windows 10 update has caused this issue as well. I had set up all routes to localhost:3000 and it was just a simple change to 127.0.0.1:3000 that allowed the routes to work correctly.

**Note:** I was still having problems so this solution didn't fix my original issue. I ended up reinstalling Node.js and now my Node and Express applications are running without errors.
