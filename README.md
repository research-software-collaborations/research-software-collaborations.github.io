[![CI](https://github.com/research-software-collaborations/research-software-collaborations.github.io/actions/workflows/deploy.yml/badge.svg)](https://github.com/research-software-collaborations/research-software-collaborations.github.io/actions/workflows/deploy.yml)

Is this badge red? Click on it to find out what's wrong with the repository...

# Research Software Collaborations Website

GitHub pages for the Research Software Collaborations project website.

Even if you have edit permissions, please make a pull request. The advantage of
making a pull request instead of directly editing is that changes made via pull
request will be tested to ensure that all is ok with your changes...

## Testing locally quick instructions (see [setup](https://iris-hep.org/docs/webdev) for full instructions):

```bash
gem install bundler
bundle install
bundle exec rake serve
```

Alternatively, you can test your changes out using the Jekyll docker image:
```bash
docker run --rm -it \
      --volume="$PWD:/srv/jekyll"  \
      -p 4000:4000 \
      jekyll/builder:stable jekyll serve --incremental
```
This will mount your checked out copy of this repo, then build and start the
jekyll server mapping it to port 4000 on your computer. You can make changes
locally and view them at http://localhost:4000

## Dealing with the submodule...

There is now a submodule under _data/project_database. This will get updated once per day to the head of the main branch. To do by hand, you can do:
```
cd _data/project_database
git pull 
cd ..
git add project_database
git commit -m 'pick up new commits'
git push
```

## Color codes for Indian Flag

Orange = #FF9933
White = #FFFFFF
Green = #138808

## Monsoon season

[Monsoon season at Scheme Color](https://www.schemecolor.com/monsoon-season.php)

#B5C7CC #8BA1AD #587B89 #244C66 #407D6C #7DB290

