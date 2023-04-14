+++
title = "LinkedIn WebCrawling in JS pt.1"
date = "2023-04-13T19:45:11-04:00"
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
# Intro to Web Crawling
If you don't know, web crawling (or scraping), refers to using some tool to automate searching through the internet, 'scraping' the content you want and storing it as local files, in a DB, what have you. While there are a ton of great tools for this, I started in TypeScript, using Cheerio and Axios to perform LinkedIn web-crawling. An effective web-crawler will parse through the selected domain, be it LinkedIn, USAToday, or whatever, fetching the HTML of releveant pages and storing them for local use. To be more selective, the crawler can use some parsing tools to find keywords, or just extract headers, the body, whatever you want. For JS projects, the go to seems to be **Axios** and **Cheerio**, for fetching and parsing respectively.
## Fetching the Content with Axios
Axios is a simple to use library that allows node.js to make HTTP requests, with automatic serialization to JSON, multipart FormData, and url-encoded for the body. It is *isomorphic* (meaning that node and browser can run the same code), and supports the promise API (allowing easy asynchronous functions). In the context of web-scraping, it can be as easy as typing `axios.get(url)`, and then reading the response data (don't forget to use `.then()` as part of the promise API). The hard part can come with figuring out exactly what URL to use. For LinkedIn, after some messing around I found this format worked best:
>https://www.linkedin.com/jobs-guest/jobs/api/seeMoreJobPostings/search?keywords=job%20title%20here&location=United%20StatesgeoId=103644278&trk=public_jobs_jobs-search-bar_search-submit&position=1&pageNum=0&start=0
### Querying with Cheerio
Cheerio allows you to make jQuery queries, all you need to do is define a cheerio object with `const $ = cheerio.load(response.data)`, where response.data can be exchanged with any HTML code. From there, queries are easy. For LinkedIn, I just found all jobs by using `const jobs = $('li')`, quering all list-items in the HTML. This is easily generalized, and you can query with selectors with the syntax `$(selector)`, finding forms, lists, classes, etc. Cheerio also allows you to insert/edit the HTML, useful for situations where you need to automate filling out forms.
#### To do
While I've only just started this project, I hope to finish up a basic backend tomorrow, and which point I'll write a followup for any tips for making your own web-crawler.
