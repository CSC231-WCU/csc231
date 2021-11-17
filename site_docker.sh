#!/bin/bash

rm -Rf _site/*
docker run -v ${PWD}:/srv/jekyll -it linhbngo/jekyll:latest bundle exec jekyll build
rsync -a _site/ lngo@cs.wcupa.edu:~/public_html/csc231/
#scp -r _site/* lngo@cs.wcupa.edu:~/public_html/csc231/
