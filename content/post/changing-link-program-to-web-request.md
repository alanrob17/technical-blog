---
title: "Changing Link Program to Web Request"
description: Using Web Request to automatically download web pages.
date: 2019-11-21T13:46:20+10:00
draft: false
tags: 
    - "CSharp"
categories: 
    - "Programming"
---

### Changing the Link program to download a Web Request

My *Link*, *Packt* and *Plural* programs have been set up to manually get a webpage and this is a slow process.

I have updated the **Link** program to pass in a URL as an argument and then download and create the page automatically. This saves me a boring task.

The program update was more complex than I originally thought because the pages I was trying to download used a network security protocol so I was getting TLS security failure exceptions. My Original WebRequest code that I have used for years works on most websites but failed on LinkedIn and Pluralsight. To make matters worse when I fixed the LinkedIn issue it wouldn't work with the Pluralsight URL's. I now have it so that I can download webpages from all three websites with the same set of code.
