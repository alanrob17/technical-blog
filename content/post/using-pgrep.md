---
title: "Using PGrep"
date: 2022-10-28T14:24:14+11:00
draft: false
categories:
  - "Windows"
  - "Linux"
tags:
  - "DOS"
  - "Bash"
  - "Scripting"
---

I often use ``grep`` in Windows and Linux to find text in files. I have noticed that ``grep`` only works on traditional text files with .txt, .c, .cpp, .list, etc extensions. It doesn't work with Markdown and C# text files and I find this frustrating.

I have found a [parallel grep program](https://learn.microsoft.com/en-us/samples/dotnet/samples/parallel-programming-grep-cs/) in the Microsoft Learn code samples written by [David Pine](https://github.com/IEvangelist) that overcomes the ``grep`` limitations.

The thing that I really like about this program is that I can use regular expressions in the search text.

I have made some minor modifications to the command line arguments in this code.

### Arguments

* ``-s`` search sub directories.
* ``-i`` ignore case.
* ``-n`` remove the file and line numbers from the display.

### Usage

A simple example.

```bash
    pgrep -si "main" *.cs
```

> .\RecordDBToJSON\ExtractData.cs:23         public static int Main(string[] args)

Using regular expressions.

```bash
    pgrep "(#\s|##\s|###\s)" Working*.md
```

Returns.

```text
.\working-with-data-and apis.md:1 # Working With Data and API's in JavaScript
.\working-with-data-and apis.md:3 ## The fetch() function
.\working-with-data-and apis.md:68 ## URL.createObjectURL()
...
````

I can modify this to create a simple table of contents list for any Markdown file.

```bash
    pgrep -n "(#\s|##\s|###\s)" Working*.md
```

Returns.

```text
# Working With Data and API's in JavaScript
## The fetch() function
## URL.createObjectURL()
## Handling errors
## async /await
### Extra challenges
...
```

I will be using ``pgrep`` extensively from now on.

### Added notes

I found that I can't pipe this command into a text file which is something I would do to keep the results of my search.

```
  pgrep ([Dd]ylan) *.txt > BobDylan.txt
```

Returns this message.

> The process cannot access the file 'C:\folder\BobDylan.txt' because it is being used by another process.

I can get around this issue with the following command.

```
  pgrep ([Dd]ylan) *.txt > BobDylan.lst
```
