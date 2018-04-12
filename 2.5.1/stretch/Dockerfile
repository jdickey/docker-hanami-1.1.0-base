FROM jdickey/hanami-1.1.0-base:2.5.1-no-qt
LABEL maintainer="Jeff Dickey <jdickey at seven-sigma dot com>"
LABEL description="Hanami app Gems base image based on Debian Stretch with Ruby 2.5.1, including Qt and capybara-webkit"
LABEL includesQt=true
LABEL version="0.13.0"

RUN apt-get update -qq && apt-get dist-upgrade -y && apt-get clean && find /var/lib/apt/lists/* -delete \
 && gem install capybara \
 && gem cleanup
