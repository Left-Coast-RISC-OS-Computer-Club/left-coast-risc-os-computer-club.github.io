#!/bin/bash


for FNAME in contributing_news_items.md index.md README.md riscos.md; do
  HTML_NAME="$(basename "${FNAME}" ".md").html"
  printf "%s -> %s\n" "${FNAME}" "${HTML_NAME}" 
  pandoc -s -f markdown -t html5 --template page.tmpl "${FNAME}" >"${HTML_NAME}"
  git add "${HTML_NAME}"
done
pandoc -s -f markdown -t html5 --template page.tmpl riscos.md >riscos_list.html

antenna generate

# Build our search indexes now that we have HTML pages.
pagefind \
  --verbose \
  --force-language en \
  --site .
if [ -d .git ] ; then git add pagefind; fi
