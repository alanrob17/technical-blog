---
title: "Renamer Project"
description: Renaming directory files.
date: 2019-10-16T10:43:27+10:00
draft: false
categories:
    - "Programming"
tags:
    - "CSharp"
---

I downloaded some files recently and every file contained a prefix with the website's name in it. This included all of the source code files which rendered the code useless.

I tried using my **Name** utility program to remove the offending phrase but it ended up changing the names of some files. I need to remove the prefix without changing the rest of the filename. My first option was to search the web for a free file renaming program. All I found was a program that you had to pay for or a very complicated utility with a million options for renaming files that I didn't need.

In the end it was easier to create my own utility to perform the task. I used the basic code from the **Names** program and took out all of the name changing options and just allowed it to remove a particular phrase.

The utility has an option to work on the current directory or all directories. It can also produce a report of the changes to be made before changing the actual filenames.

**Usage:**

> renamer -sw "Remove-this-phrase-from the-file-name"       
>       
> s = remove from all sub folders.      
>       
> w = write changes to all files with that particular phrase in it. If you ignore this it will just produce  a log file with all of the changes to take place.
