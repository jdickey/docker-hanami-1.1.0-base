FROM jdickey/ruby:2.5.0-no-qt
LABEL maintainer="Jeff Dickey <jdickey at seven-sigma dot com>"
LABEL description="Hanami app Gems base image based on Debian Stretch with Ruby 2.5.0, NOT including Qt or capybara-webkit"
LABEL includesQt=false
LABEL version="0.12.0"

# Version 3.3.3 of `rom` depends on `dry-types` 0.12.2, but Version 1.1.0 of
# `hanami-model` depends on `dry-types` 0.11.1. This will eventually get cleaned
# up, upstream.

RUN apt-get update -qq && apt-get dist-upgrade -y && apt-get install -y libpq-dev && apt-get clean \
 && find /var/lib/apt/lists/* -delete \
 && gem install rake -v 12.3.0 \
 && gem install mini_mime -v 1.0.0 \
 && gem install rack -v 2.0.3 \
 && gem install concurrent-ruby -v 1.0.5 \
 && gem install dotenv -v 2.2.1 \
 && gem install dry-configurable -v 0.7.0 \
 && gem install dry-container -v 0.6.0 \
 && gem install dry-core -v 0.4.1 \
 && gem install dry-equalizer -v 0.2.0 \
 && gem install dry-initializer -v 1.4.1 \
 && gem install dry-logic -v 0.4.2 \
 && gem install inflecto -v 0.0.2 \
 && gem install dry-types -v 0.11.1 \
 && gem install ice_nine -v 0.11.2 \
 && gem install dry-struct -v 0.3.1 \
 && gem install dry-validation -v 0.11.0 \
 && gem install transproc -v 1.0.2 \
 && gem install hanami-utils -v 1.1.1 \
 && gem install hanami-helpers -v 1.1.1 \
 && gem install tilt -v 2.0.8 \
 && gem install hanami-assets -v 1.1.0 \
 && gem install hanami-cli -v 0.1.0 \
 && gem install hanami-controller -v 1.1.1 \
 && gem install mail -v 2.7.0 --no-doc \
 && gem install hanami-mailer -v 1.1.0 \
 && gem install url_mount -v 0.2.1 \
 && gem install http_router -v 0.11.2 \
 && gem install hanami-router -v 1.1.0 \
 && gem install hanami-validations -v 1.1.0 \
 && gem install hanami-view -v 1.1.0 \
 && gem install hanami -v 1.1.0 \
 && gem install rom-mapper -v 0.5.1 \
 && gem install rom -v 3.3.3 \
 && gem install rom-repository -v 1.4.0 \
 && gem install sequel -v 4.49.0 \
 && gem install rom-sql -v 1.3.5 \
 && gem install hanami-model -v 1.1.0 \
 && gem install minitest -v 5.10.3 \
 && gem install pg -v 0.21.0 \
 && gem install shotgun -v 0.9.2 \
 && gem install temple -v 0.8.0 \
 && gem install slim -v 3.0.9 \
 && gem cleanup
