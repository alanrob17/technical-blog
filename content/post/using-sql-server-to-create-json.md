---
title: "Using SQL Server to Create JSON"
description: Creating JSON from SQL Server.
date: 2020-04-17T12:14:51+10:00
draft: false
categories:
    - "Programming"
tags:
    - "SqlServer"
    - "CSharp"
---

I am currently creating a JavaScript based website to display a version of my RecordDB database. The data will need to be consumed from a JSON file that will be stored in a web browser using local storage.

The advantage of using local storage is that it is persistent and will still be available once you close and reopen your web browser. The first part of this process will be to export my data from a SQL Server database to a JSON formatted file.

#### Using SQL Server to create JSON from SQL queries

My first efforts in using SQL Server to dump SQL query data as JSON were a failure because I couldn't get the JSON to validate successfully.

When I dumped the results to the SQL Server grid view it came up with an XML error that didn't tell me much.

![XML error.](/images/xml-error.jpg "XML error.")

There were a couple of options in the Tools menu that I could change but none of these fixed the problem I had.

I then tried to dump the data into the text view and all of my data was being truncated at an arbitrary character length.

![Truncated data.](/images/truncated-data.jpg "Truncated data.")

I was able to find out how to change the line length in MSSQL.

![Truncated text.](/images/text-options.jpg "Truncated text.")

I upped the default value to 20480 characters thinking that this could help the problem but it just changed the truncation to a different position.

My next option was to save the data to a file. I still couldn't validate the JSON data but I found that if I deleted all of the line feed / carriage returns out of the data that it would work. I used the extended Find & Replace option in Notepad++ to do this.

![Remove all carriage returns.](/images/remove-carriage-returns.jpg "Remove all carriage returns.")

The final results:

![JSON data results showing in Google Chrome.](/images/json-data-results.jpg "JSON data results showing in Google Chrome.")

Once I got to this stage I realised that I had another problem. The data was just a flat table and instead of being 1 artist with many records each row repeated all of the artist's data for all of that artist's records.

This is very frustrating so I am going to write a C# program to join the data correctly.

To read more about creating a JSON data file see [JSON formatted record list.](https://blurt.netlify.app/creating-a-json-file-from-my-record-list-recorddbtojson/)
