---
title: "Problems with conflicting ports"
description: Conflicting ports with Docker and Azure Cosmos Db.
date: 2024-01-06T17:59:30+10:00
draft: false
categories:
  - "Docker"
tags:
  - "Azure-Cosmos-Db"
  - "Hardware"
  - "Windows"
  - "Linux"
---

I am having a problem with port 8081 conflicting with Azure Cosmos DB emulator and my Docker containers.

The obvious fix was to change the Docker container that was using the host port 8081. I was surpised that Azure Cosmos DB was using this port so I decided to ask Perplexity why this was happening. The answers I got back were impressive.

Once my containers are up and running I can't use Azure Cosmos DB Emulator because I get a message from the Emulator saying that Port 8081 is in use.

![Port conflict](/images/ports.jpg "Port conflict")

## Why this is a Problem

**Host Port Availability:** The Azure Cosmos DB Emulator attempts to bind to port 8081 on your local machine. Since your Docker container has already bound that port for its own use, the emulator cannot access it.

**Container vs. Host:** While services inside a Docker container can communicate freely with each other using their internal ports, any ports exposed to the host must be unique and available for any application trying to bind to them directly on the host.

The fix is to change the host 8081 port mapping.

{{< highlight bash >}}
 ports:
      - "8080:8080"
      - "8081:8081"
{{< / highlight >}}

To.

{{< highlight bash >}}
 ports:
      - "8080:8080"
      - "8082:8081"
{{< / highlight >}}

Another method would be to change the port used by Azure Cosmos DB Emulator:

If possible, configure the Azure Cosmos DB Emulator to use a different port instead of 8081. Refer to its documentation for instructions on how to change its default ports.

## How can I check which process is using port 8081 on my host machine?

### For Windows

Open Command Prompt as an administrator and run the following command:

{{< highlight bash >}}
  netstat -aon | findstr :8081
{{< / highlight >}}

This will display the process ID (PID) of the application using port 8081. My output was.

> TCP    0.0.0.0:8081           0.0.0.0:0              LISTENING       24176    
> TCP    [::]:8081              [::]:0                 LISTENING       24176    
> TCP    [::1]:8081             [::]:0                 LISTENING       29712

Once you have the PID, you can find out which process it corresponds to by running.

{{< highlight bash >}}
  tasklist /fi "PID eq 24176"
{{< / highlight >}}

Returns.

> Image Name                     PID Session Name        Session#    Mem Usage    
> ========================= ======== ================ =========== ============    
> com.docker.backend.exe       24176 Console                    1    125,856 K

The other PID.

{{< highlight bash >}}
  tasklist /fi "PID eq 29712"
{{< / highlight >}}

> Image Name                     PID Session Name        Session#    Mem Usage    
> ========================= ======== ================ =========== ============    
> wslrelay.exe                 29712 Console                    1     10,560 K

You can also check this by using Powershell as Administrator.

{{< highlight bash >}}
  Get-Process -Id (Get-NetTCPConnection -LocalPort 8081).OwningProcess
{{< / highlight >}}

Returns.

> NPM(K)    PM(M)      WS(M)     CPU(s)      Id  SI ProcessName   
> ------    -----      -----     ------      --  -- -----------   
>      47    92.15     125.09       7.95   24176   1 com.docker.backend   
>      15     2.55      10.31       0.02   29712   1 wslrelay

## For Linux

{{< highlight bash >}}
  sudo netstat -tuln | grep :8081
{{< / highlight >}}

Or.

{{< highlight bash >}}
  sudo lsof -i :8081
{{< / highlight >}}

## Graphical Port checkers

### Windows

#### Resmon (Resource Monitor)

Is part of Windows. To use it from the Search bar.

{{< highlight bash >}}
  resmon
{{< / highlight >}}

### SysInternals TCPView v4.19 from Microsoft

You can download this from [SysInternals](https://learn.microsoft.com/en-us/sysinternals/downloads/tcpview).

These are small utilities that don't need to be installed.

To use.

{{< highlight bash >}}
  TCPView64.exe
{{< / highlight >}}

This is a graphical interface application.

![TCPView](/images/tcpview.jpg "TCPView")

I can search for an application to view. This output shows the ports being used by Docker. At the time I did the check it shows that there are database requests using the port 11433 which is my SQL Server container port. It is using the same internal and external IP address.

### SysInternals TCPVCon

Another good SysInternals console utility is TCPVCon. This allows you to check a running process by PID.

{{< highlight bash >}}
  .\tcpvcon64 -a -n 24176
{{< / highlight >}}

Returns.

> [TCP] com.docker.backend.exe    
>         PID:    24176   
>         State:  ESTABLISHED   
>         Local:  192.168.1.4   
>         Remote: 192.168.1.4   
> [TCPV6] com.docker.backend.exe    
>         PID:    24176   
>         State:  LISTENING   
>         Local:  [0:0:0:0:0:0:0:0]   
>         Remote: [0:0:0:0:0:0:0:0]

It is useful to use these tools to check your system when you are having port issues. It is also handy to know what is running on your system and to uninstall applications that aren't really necessary.
