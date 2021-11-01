---
title: "Creating A JSON File From My Record List - RecordDBToJSON"
description: Creating JSON files for my record collection.
date: 2020-04-18T14:09:05+10:00
draft: false
categories: 
    - "programming"
tags: 
    - "CSharp"
    - "JSON"
    - "SqlServer"
---

Using SQL Server for generating JSON wasn't totally successful so I created a program to reformat my record list into JSON for use in my JavaScript projects. I wanted to load it into my local storage and use it as a data source. [See my previous article.](https://blurt.netlify.app/using-sql-server-to-create-json/)

The program I created runs in the console and has no arguments. It just grabs a dump of my Artist and Record tables and merges the two sources as a 1 *artist* to many *records* JSON file.

Creating the program was straightforward but I found the JSON still wouldn't validate due to errors in my data.

The first error was removing hard coded mdash characters from my data. The next problem was that I had to remove all linefeed-carriage return characters from my artist biographies and record reviews.

Once I completed these tasks I used JSONFormatter to validate the generated JSON and now I'm able to use the JSON file in my JavaScript projects.

I have created a website that shows my record data. [recordlist.netlify.app](https://recordlist.netlify.app/)
