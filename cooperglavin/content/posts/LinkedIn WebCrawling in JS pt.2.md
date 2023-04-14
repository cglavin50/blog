+++
title = "LinkedIn WebCrawling in JS Pt.2"
date = "2023-04-14T16:08:51-04:00"
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
After making some progress on the backend, I have a couple notes.

# Some additional tips for Cheerio

The first step of using cheerio is calling `cheerio.load(html)` as discussed last time, so now I will go into the structure of Cheerio. As I'm using TypeScript, I have to be strict with my variable typing, so this should help others in the same boat. `cheerio.load(html)` returns a CheerioAPI object, which is an interface that allows you to query the HTML. Queries will return Cheerio objects, which are generics, giving you an API to traverse and modify the set returned from the initial query. Cheerio supports 3 different classes (+ Cheerio objects), **Element**, **Document**, and **Node**.
- Element: an HTML element. Attributes name, attribs, children?, type?, returning the name of the tag, an Object mapping attribute names to values, an array of Children nodes, and an enum for Script/Style/Tag.
- Document: the root node of the document (DOMS). It has parent and child nodes, as well as a cloneNode method.
- Node: used to create DOM level 1 structures. Methods and attributes same as Document, just gneeralized

## What does this look like?

In the LinkedIn Job Crawler, I first get the CheerioAPI: `const $:cheerio.CheerioAPI = cheerio.load(html);`. Next, I get a Cheerio Object storing List Item elements: `const jobsHTML: cheerio.Cheerio<cheerio.Element> = $('li');`. From there, queries are easy to write out, for example to find Job titles: `const jobTitle:string = $(element).find('h3.base-search-card__title').text().trim();`, where `.find(tagName.className)` gives us access to tags, then calling `.text()` or `.attr(attrName)` will allows us to find corresponding information.
