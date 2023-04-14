#!/usr/bin/env bash
# cd to working directory
cd /home/cglav/coding-work/blog/cooperglavin
hugo -t terminal
git add .
git commit -m "daily blog update `date`"
git push origin main
# cd to github pages
cd public
git add .
git commit -m "Daily blog post via crontab `date`"
git push origin main
