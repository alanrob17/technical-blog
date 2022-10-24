---
title: "Creating a Root Password in Linux"
date: 2022-10-24T16:25:56+11:00
draft: false
categories:
  - "Linux"
tags:
  - "Bash"
  - "Scripting"
---

I am used to gaining elevated privileges in Linux by adding ``sudo`` to a command e.g.

```bash
    sudo apt-get update
```

I wanted to stay in elevated privileges so I went to login as **root** and realised that my normal Linux account didn't have root privileges.

I did some searching on the Internet and found that most versions of Linux disable the **root** account by default.

I found that you can enable **root** by running the following command.

```bash
    sudo passwd root
```

This will ask you to add a password to the **root** account and once you do this you should be good to go.

Type **su** at the command prompt to become the root user. You could also add **root** when you log in to run with elevated privileges.

**Note:** This is something you should use sparingly and you should only use elevated privileges when you really need to.

I have tested this in Windows Subsystem for Linux (WSL) with Ubuntu and on my Linux Mint installation.
