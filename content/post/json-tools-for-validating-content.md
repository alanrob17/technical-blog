---
title: "JSON Tools for Validating Content"
description: Online tools for viewing JSON.
date: 2020-04-18T13:52:48+10:00
draft: false
categories: 
    - "Programming"
tags: 
    - "JSON"
---

I have a Google Chrome extension named **JSON viewer Awesome** and was using this for testing. The problem with this extension is that it doesn't load JSON if it has validation issues. The other issue is that it doesn't show where the errors have occurred.

The following view is validated JSON.

![JSON Viewer Awesome output.](/images/json-viewer-awesome.jpg "JSON Viewer Awesome output.")

I then changed over to using the online [JSONFormatter.org](https://jsonformatter.org/) website and was able to upload my JSON and get an error message for each place I had an issue. Unfortunately there seemed to be a lot of problems in my SQL Server formatted JSON.

I soon realised that I had issues with my artist biographies and record reviews. The main problem seemed to be that I had inserted *mdash* characters directly into my text and it was just a matter of replacing them with the mdash HTML entity.

JSONFormatter has a number of other useful options besides validating JSON. It can minify the JSON content and convert from JSON to XML or YAML. It can even produce a CSV from your JSON data.

![JSONFormatter.org](/images/json-formatter.jpg "JSONFormatter.org")
