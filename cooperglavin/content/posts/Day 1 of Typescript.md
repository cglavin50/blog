+++
title = "Day 1 of Typescript"
date = "2023-04-12T00:20:12-04:00"
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
### Trying out typescript
Today was a chaotic day (with interview prep), so didn't do much independent work. That said, I spent some time learning about JavaScript, and investigated popular frameworks (for frontend and backend). I think I'll continue using React for frontend, but interesting in using Meteor and more Node.js for backend, and I intend to switch over to TypeScript. 
First project, a web crawler with backend of basic TypeScript. I may build out a separate frontend with Typescript React as well, but we'll see after I get this working. It's going to crawl linkedin job postings with passed in keywords, and scrape relevant info (pay, remote, website, etc) into a DB (mongo? Maybe a relational?). Typescript seems a bit annoying syntactically at first, but worth the time. The project itself doesn't seem awful, making continuous GET requests, pulling the html from the response, then using Cheerio to parse and search for passed in args (cheerio uses a JQuery implementation, so I have some references to work off). Thinking about locally storing csv files as they would be easy to manipulate, but likely will use some sort of DB (want more experience here, especially with relational DBs in the cloud). That's all the notes for now, but looking forward to it.
For people who don't know about TypeScript, it's a statically typed (technically optionally) JS, allowing you to get better debugging and in theory make a more sound system. To be honest, I'm new to JS and used to being explicit in variable initiation, so I think it'll help me make more sense of the language. That said, the syntax seems a bit weird to get the hang of, esepcially explicitly defining objects, and union sets seem interesting (basically an enum object) but I'm looking forward to diving head first.
Besides that I made some changes to my workstation. I added some plugins to my zsh terminal, and releazed that I was working with files from the Windows file system that was making everything slow. I refactored my file system for dev projects and moved it over into the Linux file system, now everything has been incredibly fast.
