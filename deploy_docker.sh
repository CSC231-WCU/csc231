#!/bin/bash
echo $1
rm -Rf _site/*
echo ${PWD}
rm -Rf _site
#docker run -v ${PWD}:/srv/jekyll  -p 127.0.0.1:4000:4000/tcp jekyll/jekyll:stable /srv/jekyll/deploy.sh --verbose

docker run -v ${PWD}:/srv/jekyll -p 4000:4000 -it linhbngo/jekyll:latest /bin/bash -c "bundle exec jekyll serve --host 0.0.0.0"

#docker run -v ${PWD}:/srv/jekyll -it linhbngo/jekyll:latest bundle exec jekyll build


