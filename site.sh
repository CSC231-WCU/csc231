#!/bin/bash
set -x

bundle install
bundle exec jekyll build
#scp -rq _site/* lngo@cs.wcupa.edu:~/public_html/csc231
rsync -a _site/ lngo@cs.wcupa.edu:~/public_html/csc231/
