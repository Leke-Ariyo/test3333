#!/bin/bash

set -e

# get the SHA to revert
COMMIT_TO_REVERT=$1
REPO_FULLNAME=$2

git remote set-url origin https://x-access-token:$GITHUB_TOKEN@github.com/$REPO_FULLNAME.git
git config --global user.email "revert@github.com"
git config --global user.name "GitHub Revert Action"

set -o xtrace

git fetch origin master

# do the revert
git checkout -b master origin/master

# check commit exists
git cat-file -t $COMMIT_TO_REVERT
git revert $COMMIT_TO_REVERT --no-edit
git push origin master