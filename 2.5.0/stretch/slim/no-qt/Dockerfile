FROM jdickey/ruby:2.5.0-slim-stretch-no-qt
LABEL maintainer="Jeff Dickey <jdickey at seven-sigma dot com>"
LABEL description="Hanami app Gems base image based on slimmed-down Debian Stretch with Ruby 2.5.0, NOT including Qt or capybara-webkit"
LABEL includesQt=false
LABEL version="0.13.0"

RUN apt-get update -qq && apt-get dist-upgrade -y && apt-get clean && find /var/lib/apt/lists/* -delete \
 && gem install mail -v 2.7.0 --no-doc \
 && gem install rake hanami:1.1.0 hanami-model:1.1.0 minitest shotgun slim \
 && gem cleanup
