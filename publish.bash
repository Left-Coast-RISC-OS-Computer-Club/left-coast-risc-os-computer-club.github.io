#!/bin/bash
#
if ! antenna harvest; then
  echo "Failed harvest, aborting"
  exit 1
fi
./website.bash
git commit -am "publishing to main branch"
