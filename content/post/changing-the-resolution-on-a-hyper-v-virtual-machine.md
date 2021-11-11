---
title: "Changing the Resolution on a Hyper-V Virtual Machine"
description: "Notes on how to change the default resolution on a Hyper-V Linux VM."
date: 2021-11-12T09:38:23+11:00
draft: false
categories: 
    - "Programming"
tags: 
    - "Linux"
    - "Hyper-V"
---

I have installed Hyper-V on my PC. I am going to use this to test various Linux distributions.

I have noticed that every time I load a new distribution as a virtual machine it doesn't display full screen. I have to change the resolution to be able to see my Linux system in full screen mode.

One way to change your resolution is via the following:

Open a terminal window.

```bash
    sudo nano /etc/default/grub
```

Find the line **GRUB_CMDLINE_LINUX_DEFAULT**

Modify the line with the resolution you want, ex: 1920x1080:

```text
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=hyperv_fb:1920x1080"
```

Write the changes to Nano and quit.

Enter the following command.

```bash
	sudo update-grub
```

Reboot the VM.

If you can use the "Quick Create" option in Windows 10 Hyper-V, I believe you'll get a better experience and the ability to adjust the resolution on the fly. It doesn't seem that you can configure a manual install to do this.

**Note:** I had to reboot a couple of times before my resolution changed.

