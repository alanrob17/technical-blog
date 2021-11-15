---
title: "Sharing Files Between Windows and Hyper-V"
description: "This is how I share files between WIndows and Hyper-V."
date: 2021-11-15T15:17:36+11:00
draft: false
categories: 
    - "Programming"
tags: 
    - "Linux"
    - "Hyper-V"
---

One of the shortcomings I find with Hyper-V is that it isn't easy to copy files from Windows into my Hyper-V virtual environment.

I have found a quick and easy method to share a virtual WIndows folder with Hyper-V and will describe how to set this up.

## Starting a file share

You need to open Control Panel and "Turn Windows Features On And Off". From here select **SMB 1.0/CIFS File Sharing Support** and **SMB Direct**.

![Turn on Windows features](/images/windows-features.jpg "Turn on Windows features")

Once you have completed this process you need to turn on advanced sharing.

![Turn on advanced sharing](/images/advanced-sharing.jpg "Turn on advanced sharing")

When you have completed this you need to create a share folder on your local Windows machine.

In my case I am sharing a folder named **Virtual**. Go to the properties of this folder and click on the *Sharing* tab and then click on the *Share* button. This will ask you for a user to share files with and here you select your user name. Click on the *Share* button once you have selected a user. You will need Administrator privileges to do this. Once you have completed this you should see the following.

![Virtual properties](/images/virtual-properties.jpg "Virtual properties")

In my case the virtual properties shows the network path.

```bash
    \\tiger\virtual
```

This is my Windows network path. I will need to change the backward slashes to forward slashes on my virtual Linux machine.

Now we need to access this folder on our virtual Linux machine.

## Guest and Host networking

On our Linux server both the guest and host must be on the same network for SMB/CIFS file sharing to work. We use the Default Switch option on Hyper-V to allow this to happen.

![Default Switch settings](/images/default-switch.jpg "Default Switch settings")

### Mounting the Shared Folder on Guest

In your guest OS open a terminal an add the following command.

```bash
    sudo apt install cifs-utils
```

Create a folder to mount your shared files. In my case I am creating a folder named **share** under my home folder.

```bash
    mkdir ~/share
```

Now, you need to mount this folder.

```bash
    sudo mount.cifs //tiger/virtual ~/share -o user=alanr
```

The user is your Windows user and you will need to add credentials to be able access that users account.

If this has been completed successfully you should see the *share* folder on your Linux desktop.

**Note:** you will only be able to add files to this folder using administrator privileges.

Also be aware that this command is only temporary. Each time you run your machine you will have to run the ``mount`` command to be able to share files.

A better method would be to work out how to run a script at the boot up stage.
