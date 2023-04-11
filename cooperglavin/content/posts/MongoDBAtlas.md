+++
title = "MongoDB Atlas"
date = "2023-04-09T20:23:48-04:00"
author = ""
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = ""
showFullContent = false
readingTime = false
hideComments = false
color = "" #color from the theme settings
+++
# Today I learned...
As I was crunched for time, my goal for today was to mobilize my ToDoList App project from a local DB to a cloud-based one. While in the future I plan to switch to a relational DB, in my original project I wanted to learn more about APIs, so I picked Mongo to get experience working with a nonSQL DB. 
## MongoDB Atlas
MongoDB offers a cloud-based option called Atlas, which comes with a Hobbyist tiers for new developers. The layout was essentially the same as MongoDB Compass, where I run my local deployment, with everything running within a project scale. Each project has database deployments same as Compass, and each deployment can be configured as a cloud-cluster. Beyond that, each project has a network scope, defining who can connect to this project, as well as users which define access permissions (read/write on a db deployment basis). As I have the most experience with AWS, I chose to run my cloud deployment for my ToDoList DB over AWS out of the presented options from Atlas.
### Pain Points
I've never managed user/passwords over URLs, so I needed to learn about URL encoding to make sure everything was protected. The MongoDB client implicitly will run a TLS handshake so there's encryption there, but to deal with special characters, I used the URL.QueryString and URL.Values.Encode functions to embed the the authentication into the URI string.
Another pain point I encountered was dealing with my internets subnetting scheme. As I live on-campus, the network I access from leads to tons of issues with permissions, so I tried to debug what range of acceptable IPs would work with Atlas. Starting with 0.0.0.0, I eventually figured out that Georgetown maintains a /16 instead of a /17, which after updating seemed to fix my issues.
One last aside, I also learned how to properly manage cron jobs, and set up a bash script that should backup (ex commit and push) the repos for this blog every day, so I can just create the posts and not worry about commiting and everything before I log off for the day.
All in all this was a busy day with not a ton of time to code, so I didn't run into that many noteworthy topics. Now that I've set the DB to be able to run independently of the actual web app, I'm going to look into creating a Docker image for this whole project.