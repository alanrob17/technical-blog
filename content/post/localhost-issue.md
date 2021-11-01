---
title: "Localhost Issue"
description: Problem using localhost.
date: 2019-10-19T11:15:47+10:00
draft: false
categories:
    - "Programming"
tags:
    - "Node"
---

Today I was setting up a new project to use *127.0.0.1:3000* and when I went to run the development server I got an error stating that the port was in use.

The strange thing was that I had been using port 3000 about two days previously. I can't be sure if my PC had been turned off during that period. I have to assume that it hadn't been turned off.

I did a quick Google search and good old Stack Overflow came to the rescue with the following fix.

    netstat -ano | findstr :3000

Tells me that port 3000 is being used. It produced the following results:

    TCP    0.0.0.0:3000           0.0.0.0:0              LISTENING       7108
    TCP    [::]:3000              [::]:0                 LISTENING       7108

The way to stop the process is to use the command *tskill* with the PID of the process that is running. In my case:

    tskill 7108

This stopped the process and I was able to run my current dev server. This will be handy for future development.
