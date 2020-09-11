#!/bin/bash
echo $1
rm -Rf _site/*
echo ${PWD}
rm -Rf _site
docker run -v ${PWD}:/srv/jekyll  -p 127.0.0.1:4000:4000/tcp jekyll/jekyll:stable /srv/jekyll/deploy.sh --verbose

