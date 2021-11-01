---
title: "Reinstalling Linux on My ASUS E200h Notebook"
description: Installing Linux on my ASUS E200h Notebook.
date: 2020-02-13T18:40:14+10:00
draft: false
categories:
    - "Programming"
tags:
    - "Linux"
---

Creating a new installation of Linux on my notebook is a fairly complex process so these notes describe the whole process.

I need to download the latest version of Linux Mint from the Mint website as an ISO file.

Create a boot disk on a USB using Rufus. I am using an earlier version of Rufus (v 1.31.1320) because the later versions are thought to have adware built into them. Use the settings in the picture below.

![Rufus setup](/images/rufus.jpg "Rufus setup")

Once you have created the boot disk put it in the notebook usb slot and also connect an external keyboard as well. The reason we do this is because the ``F2`` key on the notebook doesn't work that well (it took me hours to work this out!).

With the notebook turned off and using the external keyboard hold down the ``F2`` key and press the start button on the notebook.

This should boot into the BIOS settings on the notebook.

In the boot tab you should see the USB drive as an UEFI option. Select this option.

Now go to the Save & Exit tab and key down to the UEFI USB drive option and hit the Enter key on the external keyboard and this will reboot the notebook and boot up from the USB disk.

This sounds a silly thing to do seeing as you already set the boot option but if you don't do this you won't be able to boot from the USB. This is another thing that took me hours to learn.

You can now install Linux Mint from the USB.

In future you should be able to install a newer version of Linux Mint from the **Update** menu option in Linux Mint.
