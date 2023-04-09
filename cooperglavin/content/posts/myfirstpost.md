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
This is my first post on this site, so I'm going to cover what I've learned about Hugo.
# What is Hugo?
Hugo is a web-development framework that runs in Go, translating markdown documents to HTML, adding community-built themes to provide CSS styling. All in all, it gives us a great package to set up and run a static webpage. While there are a ton of options out there (many built on JS), Hugo has a wide variety of tools for developing a more complex site (including API-driven content and customization), as well as incredibly fast build times. I chose Hugo as I couldn't resist a web-builder framework built in Go, and it's plug-and-play themes made it an easy way to start this project.
## How do I update this site?
I'm still learning Hugo, so these are some notes before I forget how to deploy a new post. First of all, I'm hosting everything in my "blog" github repo, however the deployment is the actual GitHub pages repo. Hugo -t terminal builds the site pages with the theme terminal, which then directs all the output to the submodule pages repo. That way, I can run hugo server -t terminal, building the pages and getting a local run to make sure everything looks great and I can commit these changes. I locally installed the theme, so won't worry about updating that (recommendation course of action is through Github actions). Posts are created with hugo new posts/postname, and other pages (ex about, links, etc) are all created/stored in the contents subdirectory. Hugo has set styling for the markdown pages that I'm still figuring out, so far now it is a copy-and-paste affair, coupled with the md formatting I already know.
### What's next?
Well, as I plan to do this daily I should likely schedule a cron job for commiting and updating the respective repos. I need to figure out where to locally store images so I can make my about page reflect me, and finish developing out the core of the website (about page, links, portfolio, menu), and keep writing!