+++
title = "Firebase"
date = "2023-04-10T19:38:57-04:00"
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
# Today I learned about Firebase!
Today I had some time, so I cleaned up my workstation, learned about deployments, and started a quick little side project involving React and Firebase.
## What is Firebase?
Firebase is esseentially Google's SDK that allows you to deploy and scale apps, providing an API for everything to user authentication, a non-relational database, ML, and even mobile alerts. With a strong React JS library, I was able to follow a guide and get a basic real-time chat app up and running. With AWS-like IAM configuration, I was able to create security rules surrounding the DB, easily creating a function to limit only Georgetown users from manipulating the DB (still needed to implement this on the frontend as well), as well as validate input such that only signed in, non-banned (to be implemented soon) users can access. 
### What did I practice?
I was able to get some more React practice under my belt. Hooks and states are becoming more comprehensive, and I was able to use them as well as props to effectively create this app without getting too lost. While in the future I want to try some projects with Typescript to use JS as a OOP-langauge, functional React is starting to make sense to me. I got more practice learning APIs/reading documentation with Firebase, and got to see how it can easily make up a strong backend for any project (for cheap too). While I do enjoy backend-development, this may become my choice for quick and easy deployments for web apps, given the tools for authentication and databases were pretty much 2 mouse-clicks away to get running. 
I was able to remember some old JS syntax, with windows alerts for pop-up error messages (will clean this up later), and getting some more practice with React ref's as well.
I also got some deployment practice with Firebase Hosting. Easily combined with Github and NPM, I was able to run npm run build to get production code in the build folder, which then is used from firebase's deploy function to get up and running, even setting up Github actions to automate this process with every PR to the repo. With a free domain as well, Firebase Hosting will definitely be a tool I use in the future for applications. The firebase CLI made the deployment process easy, with just firebase login, init, and deploy to get everything set up.
#### What next?
Well, I want to clean this app up a bit more and see if I can create an anonymous chat system for Georgetown students. This involves creating a ban scheme (could use ML for sentiment analysis), and I could create mobile alerts as well. While I'm about to hit a time-crunch for the next two weeks, I'll definitely come back to this project when I have time. I want to continue practicing my react for web development, and this is as good a place as any to work.