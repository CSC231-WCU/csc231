#!/bin/bash
echo $1
#rm -Rf _site/*
echo ${PWD}
#rm -Rf _site
docker run -v ${PWD}:/srv/jekyll -it jekyll/jekyll:stable /srv/jekyll/site.sh --verbose
rsync -a _site/ lngo@cs.wcupa.edu:~/public_html/csc231/
#scp -r _site/* lngo@cs.wcupa.edu:~/public_html/csc231/
