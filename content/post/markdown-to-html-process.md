---
title: "Markdown to HTML Process"
description: Using Markdown to create HTML.
date: 2020-06-21T18:06:21+10:00
draft: false
tags:
    - "Markdown"
    - "HTML"
categories:
    - "Programming"
---

For a number of years I have been using **Dillinger.io** to compile my Markdown files into HTML. The process was relatively easy and I could quickly take the body content out of the exported web page and insert it into a **Bootstrap** HTML template to produce a styled web page.

The HTML that was created wasn't valid HTML but I wasn't concerned with that. Recently I found that Dillinger started changing the formatting of the HTML content it was producing. It started changing the single and double quotes into a Microsoft Word doc format. This is unacceptable to me because I use these in my source code examples and I had to reformat these to standard quote characters. It also changed the tags I use to format my code examples so I had to manually change these as well. Today I found that Dillinger removed all of the email and password values in my code examples leaving a "protected code" message. This was unacceptable to me so I decided to dump Dillinger and look for another Markdown to HTML converter.

I found a Visual Studio Code extension named **Markdown PDF** that could convert my Markdown code to a number of different formats. I installed the extension and found that it produced very clean and valid HTML code.

The process is very simple and all I have to do is use a ``Ctrl-Shift-P`` to bring up a menu option to Export my Markdown to HTML. If I click on this option it will compile my Markdown into a web page with the same name as my Markdown page. The nice thing is that it leaves my single and double quote characters in the same format that I created in the original document.

All I have to do now is pull out the html body text and add that to a Bootstrap template. I reformat the opening and closing tags to my code examples so that I can use a syntax highlighter and I end up with a nicely formatted web page.

The interesting thing is that I can also choose the option of compiling my Markdown to PDF if I need to.
