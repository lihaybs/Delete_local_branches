#!/bin/bash

# Fetch the latest changes from the remote repository
git fetch

# Get the list of local branches
local_branches=$(git branch | cut -c 3-)

# Loop through the local branches
while read -r branch; do
  # Check if the branch exists in the remote repository
  if ! git show-ref -q --heads "refs/remotes/origin/$branch"; then
    # If the branch does not exist in the remote repository, delete it
    git branch -D "$branch"
  fi
done <<< "$local_branches"
