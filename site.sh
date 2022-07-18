#!/bin/bash
set -x

bundle install
bundle exec jekyll build

if [ $? -ne 0 ]; then
  bundle config set --local path '.vendor'
  bundle install
  build exec jekyll build
fi

rsync -a _site/ lngo@cs.wcupa.edu:~/public_html/csc231/
