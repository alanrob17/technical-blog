---
title: "Using the Correct Version of Windows Subsystem for Linux"
description: "Checking your installed version of WSL subsystem for Linux"
date: 2021-11-29T17:04:13+11:00
draft: false
categories: 
    - "Linux"
tags: 
    - "WSL"
    - "Bash"
---

I have been using the Windows Subsystem for Linux (WSL) for a number of years and just assumed that I was using WSL 2.

A quick check told me that I was definitely using WSL 2.

**Note:** I am using Powershell to check the version of WSL I have installed.

```powershell
    wsl --status
```

Returned.

> Default Distribution: Ubuntu-20.04        
> Default Version: 2        
>       
> Windows Subsystem for Linux was last updated on 3/11/2021     
> WSL automatic updates are on.     
>       
> Kernel version: 5.10.60.1

Things were looking as they should until I ran the following command in Powershell.

```powershell
	PS C:\Users\alanr> wsl -l -v
	NAME                  STATE           VERSION
	* Ubuntu-20.04          Running         1
	Alpine                Stopped         1
	openSUSE-Leap-15.3    Stopped         1
	Debian                Stopped         1
```

It was telling me that I was using WSL version 1 instead of version 2. I was a little surprised at this so did some reading and found that even though you install WSL 2, Windows will use WSL 1 as the default.

Run the following command to set up WSL 2.

```powershell
	PS C:\Users\alanr> wsl --set-default-version 2
```

This returned.

> For information on key differences with WSL 2 please visit https://aka.ms/wsl2        
> The operation completed successfully.

Running ``wsl -l -v`` again gave me the same results as above. All of my versions of Linux were running WSL 1 instead of 2.

It turns out that you have to uninstall all of your versions of Linux and then reinstall them to run in WSL 2.

I have reinstalled Ubuntu 20.04 so then ran ``wsl -l -v`` again. This time it returned the following.

```powershell
    PS C:\Users\alanr> wsl -l -v
      NAME            STATE           VERSION
    * Ubuntu-20.04    Running         2
```

It is now reporting back correctly.

It was worth persisting with and resolving this issue because WSL 2 is supposed to run at around 5 times the speed of WSL 1 when running everyday web development tasks.

It has further benefits in.

* Increased file IO performance
* Full System Call Compatibility

I am surprised that Microsoft doesn't automatically default to WSL 2. It would have saved me reinstalling all of my Linux virtual machines.

## Using Virtualization mode in your BIOS

When running Windows Subsystem for Linux you should make sure that your BIOS has the virtualization mode running. You can check this in the performance tab of your Task Manager.

![Checking that virtualization is running](/images/virtualization.jpg "Checking that virtualization is running")

In the bottom-right hand corner you can see that virtualization is enabled.
