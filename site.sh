#!/bin/bash
set -x

bundle exec jekyll build
rsync --size-only  -r _site/* lngo@cs.wcupa.edu:~/public_html/csc142