#!/bin/bash
# change to cooperglavin directory
cd /home/cglav/coding-work/blog/cooperglavin
# generate public content
hugo -t terminal
# add public content
current_date_time=$(date)
git add content/posts
git add public
git commit -m "daily blog update $current_date_time"
git push origin main