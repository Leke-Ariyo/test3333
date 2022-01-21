#!/bin/bash

set -e

# get the SHA to revert
COMMIT_TO_REVERT=$1
REPO_FULLNAME=$2

echo $1
echo $2
echo "yup"

git remote set-url origin https://x-access-token:$GITHUB_TOKEN@github.com/$REPO_FULLNAME.git
git config --global user.email "revert@github.com"
git config --global user.name "GitHub Revert Action"

set -o xtrace

git fetch origin main
git revert $COMMIT_TO_REVERT
git push origin main
