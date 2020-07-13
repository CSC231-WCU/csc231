set args1=%1
echo %args1%
echo ${PWD}
rm -Force -Recurse _site
docker run -v "%cd%":/srv/jekyll -it jekyll/jekyll /bin/bash -c "bundle install; bundle exec jekyll build" --verbose
scp -rq "_site/*"  %args1%:~/public_html/csc231/