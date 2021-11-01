---
title: "Renumbering Training and Music Files - Num"
description: Renumbering training and music files with consistent numbering.
date: 2019-11-17T12:03:37+10:00
draft: false
categories:
    - "Programming"
tags:
    - "CSharp"
    - "Music"
---

Following on from my directory renaming program I have written some more code to renumber my video training and music files. Once again this is something that I have been doing for years and should have automated as some of the training materials can take around 10 to 45 minutes of manual work. I have a backlog of files that I wasn't going to finish so I had to come up with a better way of doing the task.

I have been using the program for a couple of weeks now and have been able to clear around 150 folders of training materials so I am ecstatic at the amount of time I have saved. While there are still some folders that require manual intervention I have cut down my times on average to around 1-2 minutes per training course.

The folders of material I have to renumber have never been in a consistent format so I have had to program for a number of different formats. I have also written three other programs to download "table of contents" from various training sites to help with renumbering files that have inconsistently numbered files that require manual intervention. I will now describe how these programs work and the workflow I use to complete my work.

If the directory structure for the training materials isn't consistent I will rename the folders using the **DList** program. This tries to rename the folders and creates a batch file that I can use to manually change the folder structure if needed.

I then run the **Num** program with a number of switches depending on the files I am trying to renumber.

> ``-s`` is used to renumber the files in all sub folders. Leaving this off will only renumber the files in the current directory.      
>       
> ``-w`` states that I don't want to check what I am renumbering and just renumbers the files. In either case it will produce a log file that details the name changes that will take place.        
>       
> ``-b`` is used for music files that have comments in the music track names. I don't want to see these as they are also added to the Id tags within the track itself.

If there are training materials that require more intervention I will use the following programs to help me with the renumbering.

**Link** retrieves a "table of contents" listing for training materials from LinkedIn. It requires the name of a text file with the contents of the web page for the training materials. At present I am manually saving the page and adding it to the root directory of the training materials. I will automate this process in the future by just getting the URL to the training materials and then using my program to download the content. This will save me doing the manual process of getting the page content.

**Plural** retrieves the page content for Pluralsight training files.

**Packt** retrieves the content from the Packtpub website.

#### Notes

The **Num** program is consistent in most cases but there are times when a quick eyeball of the directory content can be helpful. The program works on the assumption that everything to the left of the first space character is part of a number prefix. If a file name doesn't start with a number then I will ignore that file.

If a file name has a number after the first space character then my coding doesn't work as anticipated.

for example this file will be renumbered correctly from:

{{< highlight bash >}}
    1. This Is My Music File.flac
{{< / highlight >}}

To:

{{< highlight bash >}}
    01 - This Is My Music File.flac
{{< / highlight >}}

This file will need to be manually fixed.

{{< highlight bash >}}
    1. 12 Tons Of Steel.flac
{{< / highlight >}}

would be renamed to:

{{< highlight bash >}}
    112 - Tons Of Steel.flac
{{< / highlight >}}

This situation doesn't come up that often so it isn't a big issue.
