#!/bin/bash
#

WORKING_BRANCH=$(git branch | grep '* ' | cut -d \  -f 2)
if [ "$WORKING_BRANCH" = "gh-pages" ]; then
    ./website.bash
    git commit -am "publishing to gh-pages branch"
    git push origin gh-pages
else
    echo "You're in $WORKING_BRANCH branch"
    echo "You need to pull in changes to the gh-pages branch to publish"
    #read -p "Pull into gh-pages and publish? Y/N " YES_NO
    #if [ "$YES_NO" = "Y" ] || [ "$YES_NO" = "y" ]; then
    # Makeing sure working branch is ready
    echo "Committing and pushing to $WORKING_BRANCH"
    git commit -am "commiting to $WORKING_BANCH";
    git push origin "$WORKING_BRANCH";

    # Switching to publishing branch, "gh-pages"
    echo "Changing branchs from $WORKING_BRANCH to gh-pages";
    git checkout gh-pages
    git stash
    echo "Pulling changes from $WORKING_BRANCH info gh-pages"
    git pull origin "$WORKING_BRANCH"
    echo "Merged changes from $WORKING_BRANCH"
    ./website.bash
    git commit -am "publishing from $WORKING_BRANCH to gh-pages"
    echo "Pushing changes up and publishing"
    git push origin gh-pages
    git stash clear

    # Switching back to working branch
    echo "Changing back to your working branch $WORKING_BRANCH"
    git checkout "$WORKING_BRANCH"
fi
