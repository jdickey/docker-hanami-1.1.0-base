FROM jdickey/hanami-1.1.0-base:2.4.3-no-qt
LABEL maintainer="Jeff Dickey <jdickey at seven-sigma dot com>"
LABEL description="Hanami app Gems base image based on Debian Jessie with Ruby 2.4.3, NOT including database driver, but including Qt and capybara-webkit"
LABEL includesQt=true
LABEL hanami-version='1.1.0'
LABEL version="0.13.0"

RUN apt-get update -qq && apt-get dist-upgrade -y && apt-get clean && find /var/lib/apt/lists/* -delete \
 && gem install capybara \
 && gem cleanup
