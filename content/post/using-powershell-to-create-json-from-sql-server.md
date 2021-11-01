---
title: "Using Powershell to Create JSON From SQL Server"
description: Creating JSON with SQL Server.
date: 2020-04-18T12:39:05+10:00
draft: false
categories:
  - "programming"
tags:
  - "Powershell"
  - "SqlServer"
  - "CSharp"
---

While searching for ways to generate JSON from SQL Server I found a video on using Powershell to generate JSON using calls to SQL Server. This looked interesting so I tried it out and it worked. Unfortunately it still didn't validate and just generated rubbish. I loaded the data into a text editor and found that when it hit the line return point it chopped data and added three dots to the end of each line.

This is the code I used to generate data from Powershell. It is just using .Net framework commands to connect to SQL Server and is not too much different to the way I manipulate SQL Server from C# code.

{{< highlight go "linenos=inline,linenostart=1" >}}
    # Establish connection to SQL Server
    $Instance = "LION\TIGER"
    $ConnectionString = "Server=$Instance;Database=RecordDB;
        User Id=sa;Password=passwordhere;integrated Security=false;"

    # Main query
    $query = "SELECT a.ArtistId, a.FName, a.LName, a.Name AS ArtistName, 
    r.RecordId,r.Name, r.Field, r.Recorded, r.Label,  r.  Pressing, r.Rating, 
    r.Discs, r.Media, r.Bought, r.Cost FROM Artist a 
    INNER JOIN Record r ON a.ArtistId = r.ArtistId 
    ORDER  BY a.LName, a.FName, r.recorded FOR JSON path, root"

    $connection = New-Object System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = $ConnectionString

    $connection.Open()
    $command = $connection.CreateCommand()

    $command.CommandText = $query

    $result = $command.ExecuteReader()

    $table = New-Object "System.Data.DataTable"

    $table.Load($result)

    $table | select $table.Columns.ColumnName | ConvertTo-Json

    $connection.Close()
{{< / highlight >}}

If I remove the JSON section from the query it just generates a dump of the data which is useful.

![Powershell data dump.](/images/powershell-data-dump.jpg "Powershell data dump.")

**Note:** before I can start working with Powershell I have to run the following command.

{{< highlight go >}}
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
{{< / highlight >}}

I need to run the program using the following command:

{{< highlight go >}}
  .\get-data.ps1                                                        
{{< / highlight >}}

It needs the ``.\`` to run.
