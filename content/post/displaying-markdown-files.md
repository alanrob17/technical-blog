---
title: "Displaying Markdown Files"
description: Displaying Mardown in a browser.
date: 2019-10-21T11:24:45+10:00
draft: false
categories: 
    - "Programming"
tags: 
    - "markdown"
---

I am currently creating all of my documentation in Markdown format and then converting to HTML with *dillinger.io* for viewing. I had a Visual Studio extension that could do this but every time I saved a page edit it would shift focus from Visual Studio to Chrome and that was very disconcerting. I disabled that extension.

I always seem to have a lot of typos and would like a method of viewing my Markdown files before converting them to HTML. If I find errors I have to edit them in Markdown and HTML which is painful. I did a search for Markdown viewers and found a Chrome extension named *Markdown Reader*. I have installed this and it works really well. All I do is drop my ``.md`` file onto a Chrome browser page and it displays in HTML.

The only setting I have to change to get it working is open the extension and turn *Allow access to file URLs* on.

I opened this diary page in the Markdown reader and was pleasantly surprised. On the right-hand side of the screen there was a table of contents that allowed me to select an item from the posts I have created. This is really handy as the number of items I have added is growing quickly.

It also updates the HTML page as I continue typing in my Markdown file which is another nice feature. I can switch between Visual Studio Code and the browser when I like rather than have the VS Code extension force me to view the page update every time the page is saved.

**Added note:** Markdown reader stopped working with a dreaded **CORS** error. I have switched over to *Markdown Viewer* and this has a nice interface but is missing the table of contents.