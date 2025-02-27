#!/bin/bash
 
 rm -Rf _build
source activate jupyter-book
jupyter-book build .

if [[ $1 == "site" ]]
then
  rsync -a _build/html/* lngo@cs.wcupa.edu:~/public_html/csc231/
fi

if [[ $1 == "pages" ]]
then
  git add .
  git commit -m 'update'
  git push
  ghp-import -n -p -f _build/html
fi