FROM jdickey/hanami-1.1.0-base:2.5.0-alpine-no-qt
LABEL maintainer="Jeff Dickey <jdickey at seven-sigma dot com>"
LABEL description="Hanami app Gems base image based on Alpine with Ruby 2.5.0, including Qt and capybara-webkit"
LABEL includesQt=true
LABEL version="0.13.0"

RUN apk upgrade --no-cache \
 && gem install capybara \
 && gem cleanup
