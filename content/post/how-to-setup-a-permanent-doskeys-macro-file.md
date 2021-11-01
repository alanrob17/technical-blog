---
title: "How to Setup a Permanent Doskeys Macro File"
description: Using shortcut keys to avoid repetitive typing.
date: 2020-07-12T10:09:23+10:00
draft: false
categories:
    - "Programming"
tags:
    - "Computer"
    - "Windows"
---

I needed to recreate my doskeys.macro file on a new computer. The following commands show how to setup permanent doskey commands.

Open **Regedit**.

Go to the following regedit directory.

```
    HKEY_CURRENT_USER\Software\Microsoft\Command Processor
```

Create a new key named **Autorun**.

```	
    REG_SZ
```

Value

```
    doskey /macrofile="d:\util\macros.doskey"
```

#### My macros.doskey

These are short key commands that I use every day.

```
    cr=createcmd
    cu=cleanup
    dl=dlist
    no="C:\Program Files\Notepad++\notepad++.exe" $1
    mp=D:\Util\BuildMp3Tag.exe
```

### Added note

I have found a better way to install this registry setting. I open an Administrator command prompt and run the following.

```
reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d "doskey /macrofile=\"d:\util\macros.doskey\"" /f
```

To check this.

```
reg query "HKCU\Software\Microsoft\Command Processor" /v Autorun
```

Returns.

> HKEY_CURRENT_USER\Software\Microsoft\Command Processor		
>     Autorun    REG_SZ    doskey /macrofile="d:\util\macros.doskey"

Check the registry.

![Registry setting](/images/registry-setting.jpg "Registry setting")
