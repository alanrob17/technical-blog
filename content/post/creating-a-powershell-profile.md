---
title: "Creating a Powershell Profile"
date: 2023-10-26T12:51:52+11:00
draft: false
categories:
  - "programming"
tags:
  - "Powershell"
---

Creating a Powershell profile is a great way to create variables or aliases that you can use in your day to day work.

The first thing you need to do is see if you already have a Powershell profile. You can do this by running the following Powershell command.

```powershell
    test-Path $Profile
```

if you get the following result.

> False

This means that you need to create a Powershell profile. Run this command to create a profile.

```powershell
    New-Item -path $profile -type file –force
```

It should return something similar to this.

> Directory: C:\Users\your-user-name\Documents\PowerShell

In this folder you will see the file.

> Microsoft.PowerShell_profile.ps1

### Aliases

In my profile file I have a number of aliases that reduce the amount of typing I have to do.

```powershell
new-item alias:np -value "C:\Program Files\Notepad++\notepad++.exe"       
new-item alias:today -value Get-Date      
new-item alias:dc -value docker       
```

For example ``today`` will return.

> Thursday, 26 October 2023 1:07:46 PM

``dc`` saves me having to type the word **docker** when I am running a Docker command.

``np`` will kick off Notepad++ editor from the command line.

### Variables

I can also create variables that simplify Powershell commands.

```powershell
$NTIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()      
$NTPrincipal = new-object Security.Principal.WindowsPrincipal $NTIdentity     
$IsAdmin = $NTPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
```

These are inherently useful commands but I can also run commands while I open the Powershell terminal.

For example I can set the default folder that the Powershell terminal opens with.

```powershell
    cd c:\temp\a
```

Or.

```powershell
    Set-Location C:\temp\a
```

In this case I end up with the prompt.

> PS C:\Temp\a>

### Functions

I can improve my Powershell environment by creating functions to carry out more complex tasks.

Here are some example functions that I use.

#### Finding files in a directory

```powershell
    function Find-File($name) {
        ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
                $place_path = $_.directory
                echo "${place_path}\${_}"
        }
    }
```

E.g. find-file usage.txt

Returns all files in the directory structure named usage.txt. This is case-insensitive.

**Note:** this function is fairly basic and doesn't work with wildcards such as ``*``.

#### Grep search

A version of grep.

```powershell
    function grap($regex, $dir) {
        if ( $dir ) {
                ls $dir | select-string $regex
                return
        }
        $input | select-string $regex
    }
```

Usage:

```powershell
    grap "rating|artist" ".\*.py"
```

Will search all ``.py`` files for the words **rating** or **artist**. Once again this is limited and will only pick up the first match in each line of text.

#### Disc volumes

This function produces a nice report on the status of all your systems disc drives.

```powershell
    function df {
        get-volume
    }
```

Returns a number of statistics on the status on each drive on your system.

#### Running Python scripts

I got sick of typing commands like.

> python my_script.py

Adding this function can save a lot of typing.

```powershell
    function py {
        param (
            [string] $ScriptName
        )

        $ScriptFile = $ScriptName + ".py"

        python $ScriptFile
    }
```

Now, to run a script.

> py my_script

There are an unlimited number of ways you can improve your Powershell environment and you should change your environment to suit your particular needs.

One thing I haven't mentioned is that there are a number of things you can do to change the command prompt and colour themes in your terminal. I'll leave this up to you to explore.
