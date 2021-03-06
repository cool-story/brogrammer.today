#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
git checkout master

git push origin :gh-pages
git branch -D gh-pages

hugo

git checkout -b gh-pages

mv public/* .
git checkout master CNAME
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin gh-pages

git checkout master
