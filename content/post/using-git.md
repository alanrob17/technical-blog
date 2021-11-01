---
title: "Using Git"
description: Using Git through Azure Devops.
date: 2020-04-24T18:42:40+10:00
draft: false
categories:
    - "Programming"
tags:
    - "Git"
---

I have spent the past week re-investigating Git for source control in my programming projects. Previously I used Azure DevOps (formerly Team Foundation Server or TFS) for source control. I am happy with TFS but wanted to use Git as there are millions of other users posting their projects on Github. The thing that put me off putting my projects on Github is that they are public and anyone can see them. For most of my code this wouldn't bother me but there are certain projects that I would want to keep hidden.

It dawned on me that I could use Git with Azure DevOps instead of using Github. This keeps my projects hidden and to do the same on Github would cost me around $10 Au with a limit of 5 repositories.

I have been learning Git through some video training and am surprised at how easy it is to set up a Git project. I am using the Git bash shell to do my commits and really like bash as a command line environment. It is also easy to push my projects to Azure DevOps and store them in a remote repository reducing the risk of losing my source code. The nice thing about Azure DevOps is that I can use the sprint and backlog boards to scope out my projects. Each backlog has a unique Id that I can use in my Git messages to relate the commit to my backlog or sprint item.

Previously I was keeping my source code in TFS and was happy doing this but it is more complicated to set up a repository and I had occasional issues with TFS.

I keep on forgetting where Azure DevOps keeps the links for new repositories I create so I am writing notes on the process. I have created a new local repository named Notes. I then created a repository in Azure DevOps to store a remote version of the Notes repository.

You can find the Azure Devops repository links in *Repos -> Pushes*.

    git remote add origin https://alanr.visualstudio.com/Notes/_git/Notes

    git push -u origin --all

![Repos -> Pushes](/images/project-settings.jpg "Repos -> Pushes")
