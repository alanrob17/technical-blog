---
title: "Installing Microsoft SQL Server"
description: 
date: 2020-07-09T09:05:36+10:00
draft: false
categories: 
    - "Programming"
tags:
    - "SqlServer"
---

I recently upgraded my working computer so had to reinstall all of my software. I ran into problems with my SQL Server installation.

When I am installing any major piece of software I must remember to install it with Administrator privileges.

In the installation process I give the SQL Server **Instance ID** a name. If you don't do this your SQL Server instance will be named *mssqlserver*. You will use this for all database connection strings in your applications.

With SQL Server it is always good practice to install your software on your main drive and install your databases on another drive or partition. In a production environment this is essential. Initially I tried to change my default database location to a folder that contained the databases from my previous computer and this was a big mistake. My installation crashed when SQL Server didn't have access to change the permissions of each database in the folder.

I reinstalled SQL Server and this time allowed it to use the default data folders on my main drive. 

My database directory had all of the SQL Server accounts installed so I tried to allow the files to inherit those permissions but this didn't work. looking at each file I noticed that they didn't have an owner account attached to the file.

![Unknown account owner](/images/unknown-account.jpg "Unknown account owner")

To fix this issue I had to add my user account to each database file with full permissions. I then removed the unknown account from each file as well. The image below shows the file with full permissions.

![User account with full privileges](/images/add-account-with-full-privledges.jpg "User account with full privileges")

Once I had completed this process for each database file I allowed all the files to inherit the folder permissions.

![Inherited permissions](/images/correct-inherited-permissions.jpg "Inherited permissions")

Now that all files had the correct permissions I changed the default data folder back to my data drive.

![SQL Server properties](/images/sqlserver-properties.jpg "SQL Server properties")

When I run SQL Server I also run it in Administrator mode because there are certain processes that will fail without elevated permissions.
