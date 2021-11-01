---
title: "Changing the Linux Swapfile Size"
description: Running Linux on an ASUS netbook with limited CPU and RAM.
date: 2021-10-31T17:17:21+11:00
draft: false
categories:
  - "Linux"
tags:
  - "Bash"
  - "Scripting"
---

I am having real problems keeping my ASUS netbook running. It doesn't have enough specs to run a lightweight version of Linux.

Increasing the size of the swapfile is supposed to improve the performance of low specced machines.

I have worked out how to change the swapfile size in the hope that it may help.

To check if you actually have a swapfile.

```
    swapon -s
```

This will either return nothing or detail the swapfiles statistics. In my case.

> /swapfile file    512M    0

I have a 512 Mb swapfile and 0 Mb is being used.

I need to increase the size of the swapfile so the first thing is to turn off the swapfile.

```
    sudo swapoff -a
```

Once I do this I have to remove the current swapfile.

```
    sudo rm -i /swapfile
```

In general you want to create a swapfile that is twice the size of your RAM. My RAM is 2 Gb so I need to create a 4 Gb swapfile.

```
    sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
```

Set file permissions.

```
    sudo chmod 600 /swapfile
```

Verify the permissions.

```
    ls -lh /swapfile
```

> -rw------- 1 root root 4.0G Aug 27 16:59 /swapfile

We can see that only root user has the read and write flags enabled.

Mark the file as swap space by typing.

```
    sudo mkswap /swapfile
```

We then enable the swap file.

```
    sudo swapon /swapfile
```

Verify that the swap is available and confirm 4 GB RAM and 8 GB swap by typing.

```
    free -h
```

|        | total      | used       | free       | shared     | buff/cache | available  |
|:-------|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|
| Mem:   | 1.8Gi      | 436Mi      | 778Mi      | 30Mi       | 655Mi      | 1.3Gi      |
| Swap:  | 4.0Gi      | 284Mi      | 3.7Gi      |            |            |            |

Make the swap file permanent.

First back up the ``/etc/fstab`` file in case something goes wrong.

```
    sudo cp -pv /etc/fstab /etc/fstab.bak
```

Edit ``/etc/fstab`` in your text editor.

```
    sudo gedit /etc/fstab 
```

Add this line in ``/etc/fstab`` and confirm that there are no other **"swap"** lines.

```
    /swapfile   none    swap    sw  0   0
```

Now, reboot your system and then check that the swapfile is still there.

```
    free -h
```

|        | total      | used       | free       | shared     | buff/cache | available  |
|:-------|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|
| Mem:   | 1.8Gi      | 336Mi      | 878Mi      | 30Mi       | 655Mi      | 1.3Gi      |
| Swap:  | 4.0Gi      | 184Mi      | 3.8Gi      |            |            |            |

The swapfile has been permanently increased.

This is a copy of my ``/etc/fstab`` file.

```
    # /etc/fstab: static file system information.
    #
    # Use 'blkid' to print the universally unique identifier for a device; this may
    # be used with UUID= as a more robust way to name devices that works even if
    # disks are added and removed. See fstab(5).
    #
    # <file system>             <mount point>  <type>  <options>  <dump>  <pass>
    UUID=76EF-29F0                            /boot/efi      vfat    umask=0077 0 2
    UUID=046ce35e-f04a-41d8-ab8e-d5adcd58424e /              ext4    defaults   0 1
    /swapfile none swap  sw  0 0
```
