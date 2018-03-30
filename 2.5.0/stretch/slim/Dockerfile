FROM jdickey/hanami-1.1.0-base:2.5.0-slim-no-qt
LABEL maintainer="Jeff Dickey <jdickey at seven-sigma dot com>"
LABEL description="Hanami app Gems base image based on Debian Stretch with Ruby 2.5.0, including Qt and capybara-webkit"
LABEL includesQt=true
LABEL version="0.12.0"

RUN apt-get update -qq && apt-get dist-upgrade -y && apt-get install -y libpq-dev && apt-get clean \
 && find /var/lib/apt/lists/* -delete \
 && gem install public_suffix -v 3.0.1 \
 && gem install addressable -v 2.5.2 \
 && gem install mini_portile2 -v 2.3.0 \
 && gem install nokogiri -v 1.8.1 \
 && gem install rack -v 2.0.3 \
 && gem install rack-test -v 0.8.2 \
 && gem install xpath -v 2.1.0 \
 && gem install capybara -v 2.16.1 \
 && gem cleanup
