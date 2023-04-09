+++
title = "Intro to Hugo!"
date = "2023-04-08T15:05:27-04:00"
author = "Cooper Glavin"
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = "This is a post detailing how to use Hugo and how I can make new posts."
showFullContent = false
readingTime = false
hideComments = false
color = "" #color from the theme settings
+++
I'm still learning Hugo, so these are some notes before I forget how to deploy a new post. First of all, I'm hosting everything in my "blog" github repo, however the deployment is the actual GitHub pages repo. I've linked the pages repo as a submodule, so after running "hugo -t terminal", the content will compile into the public folder, pushing it from the blog to the actual site (will likely schedule a chron job for commits every night). I locally installed the theme, so won't worry about updating that (recommendation course of action is through Github actions). As for now, the to do list is to keep exploring with Hugo, and write the about page as well as a formal first post tonight to summarize everything I've learned.