#!/bin/bash
echo $1
rm -Rf _site/*
echo ${PWD}
rm -Rf _site
#docker run -v ${PWD}:/srv/jekyll  -p 127.0.0.1:4000:4000/tcp jekyll/jekyll:stable /srv/jekyll/deploy.sh --verbose

docker run -v ${PWD}:/srv/jekyll -p 4000:4000 -it jekyll/jekyll /bin/bash -c "bundle install; bundle exec jekyll serve --host 0.0.0.0" --verbose