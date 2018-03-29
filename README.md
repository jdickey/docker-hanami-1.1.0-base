# Base Images for [Hanami](http://hanamirb.org/) 1.1.0

# Contents

- [Overview](#overview)
- [Supported Tags and Respective Dockerfile Links](#supported-tags-and-respective-dockerfile-links)
- [Gems Installed](#gems-installed)
  * [All Images](#all-images)
  * [Images Not Tagged `*-no-qt`](#images-not-tagged--no-qt)
- [Software](#software)
- [Additional Documentation](#additional-documentation)
- [Legal](#legal)

# Overview

These images are built from [`jdickey`](https://hub.docker.com/r/jdickey/hanami-1.1.0-base)'s [Customised Ruby Builds](https://github.com/jdickey/docker-ruby), with tags matching [those in the base image](https://hub.docker.com/r/jdickey/docker-ruby/README.md#supported-tags-and-respective-dockerfile-links). This leads to a bit of complexity, as we now have three significant (conceptual) versioned layers that the users of these images should care about: the base operating system (Debian Jessie or Stretch, Alpine); the version of Ruby being used (currently, 2.4.2 or 2.5.0); and the version of the Hanami framework (here, Version 1.1.0; current as of this writing). Encoding all three version identifiers into a single tag name could lead to tags such as `1.1.0-stretch-2.5.0` or, worse, `1.1.0-2.5.0` (implying "whatever the current default base OS is"). Does anyone *not* have problems with this? Hence, this repo will concern itself with *only* Hanami 1.1.0; future releases of Hanami are expected to be supported by congruently-structured and -tagged *but separate* Docker image repos.

# Supported Tags and Respective Dockerfile Links

This repository includes tags matching [those in the base image](https://hub.docker.com/r/jdickey/docker-ruby/README.md#supported-tags-and-respective-dockerfile-links), from which the images are built. The Dockerfiles are

* `2.5.0-stretch`, `2.5-stretch`, `2-stretch`, `stretch`, `2.5.0`, `2.5`, `2`, `latest` ([*2.5.0/stretch/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.5.0/stretch/Dockerfile))
* `2.5.0-stretch-no-qt`, `2.5-stretch-no-qt`, `2-stretch-no-qt`, `stretch-no-qt`, `2.5.0-no-qt`, `2.5-no-qt`, `2-no-qt` ([*2.5.0/stretch/no-qt/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.5.0/stretch/no-qt/Dockerfile))
* `2.5.0-stretch-slim`, `2.5-stretch-slim`, `2-stretch-slim`, `stretch-slim`, `2.5.0-slim`, `2.5-slim` ([*2.5.0/stretch/slim/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.5.0/stretch/slim/Dockerfile))
* `2.5.0-stretch-slim-no-qt`, `2.5-stretch-slim-no-qt`, `2-stretch-slim-no-qt`, `stretch-slim-no-qt`, `2.5.0-slim-no-qt`, `2.5-slim-no-qt`, `2-slim-no-qt`, `slim-no-qt` ([*2.5.0/stretch/slim/no-qt/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.5.0/stretch/slim/no-qt/Dockerfile))
* `2.5.0-alpine`, `2.5-alpine`, `2-alpine`, `alpine` ([*2.5.0/stretch/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.5.0/stretch/Dockerfile))
* `2.5.0-alpine-no-qt`, `2.5-alpine-no-qt`, `2-alpine-no-qt`, `alpine-no-qt` ([*2.5.0/alpine/no-qt/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.5.0/alpine/no-qt/Dockerfile))
* `2.4.2-jessie`, `2.4-jessie`, `2.4.2`, `2.4` ([*2.4/jessie/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.4/jessie/Dockerfile))
* `2.4.2-jessie-no-qt`, `2.4-jessie-no-qt`, `2.4.2-no-qt`, `2.4-no-qt` ([*2.4/jessie/no-qt/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.4/jessie/no-qt/Dockerfile))
* `2.4.2-jessie-slim`, `2.4-jessie-slim`, `2.4.2-slim`, `2.4-slim` ([*2.4/jessie/slim/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.4/jessie/slim/Dockerfile))
* `2.4.2-jessie-slim-no-qt`, `2.4-jessie-slim-no-qt`, `2.4.2-slim-no-qt`, `2.4-slim-no-qt` ([*2.4/jessie/slim/no-qt/Dockerfile*](https://github.com/jdickey/hanami-1.1.0-base/blob/master/2.4/jessie/slim/no-qt/Dockerfile))

For more information on the naming conventions, variations, and so on, see the [base image documentation](https://hub.docker.com/r/jdickey/docker-ruby/README.md#supported-tags-and-respective-dockerfile-links).

# Gems Installed

## All Images

These Gems are direct or indirect dependencies of an as-generated skeleton app for [Hanami](http://hanamirb.org) app as of the public release of Version 1.1.0. The list also includes the dependencies of `hanami-model`, including `rom` and `rom-repository`, but **does not** include Gems for accessing a particular database engine, such as [`pg`](https://rubygems.org/gems/pg) or [`sqlite3`](https://rubygems.org/gems/sqlite3). By omitting those, these images can be used as the *base* images for apps using *any* Hanami-supported database engine.

| Gem Name | Version |
| -------- | ------- |
| [`concurrent-ruby`](https://rubygems.org/gems/concurrent-ruby) | 1.0.5 |
| [`dotenv`](https://rubygems.org/gems/dotenv) | 2.2.1 |
| [`dry-configurable`](https://rubygems.org/gems/dry-configurable) | 0.7.0 |
| [`dry-container`](https://rubygems.org/gems/dry-container) | 0.6.0 |
| [`dry-core`](https://rubygems.org/gems/dry-core) | 0.4.1 |
| [`dry-equalizer`](https://rubygems.org/gems/dry-equalizer) | 0.2.0 |
| [`dry-initializer`](https://rubygems.org/gems/dry-initializer) | 1.4.1 |
| [`dry-logic`](https://rubygems.org/gems/dry-logic) | 0.4.2 |
| [`dry-struct`](https://rubygems.org/gems/dry-struct) | 0.3.1 |
| [`dry-types`](https://rubygems.org/gems/dry-types) | 0.11.1 |
| [`dry-validation`](https://rubygems.org/gems/dry-validation) | 0.11.0 |
| [`hanami-assets`](https://rubygems.org/gems/hanami-assets) | 1.1.0 |
| [`hanami-cli`](https://rubygems.org/gems/hanami-cli) | 0.1.0 |
| [`hanami-controller`](https://rubygems.org/gems/hanami-controller) | 1.1.1 |
| [`hanami-helpers`](https://rubygems.org/gems/hanami-helpers) | 1.1.1 |
| [`hanami-mailer`](https://rubygems.org/gems/hanami-mailer) | 1.1.0 |
| [`hanami-model`](https://rubygems.org/gems/hanami-model) | 1.1.0 |
| [`hanami-router`](https://rubygems.org/gems/hanami-router) | 1.1.0 |
| [`hanami-utils`](https://rubygems.org/gems/hanami-utils) | 1.1.1 |
| [`hanami-validations`](https://rubygems.org/gems/hanami-validations) | 1.1.0 |
| [`hanami-view`](https://rubygems.org/gems/hanami-view) | 1.1.0 |
| [`hanami`](https://rubygems.org/gems/gem_name) | 1.1.0 |
| [`http_router`](https://rubygems.org/gems/http_router) | 0.11.2 |
| [`ice_nine`](https://rubygems.org/gems/ice_nine) | 0.11.2 |
| [`inflecto`](https://rubygems.org/gems/inflecto) | 0.0.2 |
| [`mail`](https://rubygems.org/gems/mail) | 2.7.0 |
| [`minitest`](https://rubygems.org/gems/minitest) | 5.10.3 |
| [`rake`](https://rubygems.org/gems/rake) | 12.3.0 |
| [`rom-mapper`](https://rubygems.org/gems/rom-mapper) | 0.5.1 |
| [`rom-repository`](https://rubygems.org/gems/rom-repository) | 1.4.0 |
| [`rom-sql`](https://rubygems.org/gems/rom-sql) | 1.3.5 |
| [`rom`](https://rubygems.org/gems/rom) | 3.3.3 |
| [`sequel`](https://rubygems.org/gems/sequel) | 4.49.0 |
| [`shotgun`](https://rubygems.org/gems/shotgun) | 0.9.2 |
| [`slim`](https://rubygems.org/gems/slim) | 3.0.9 |
| [`temple`](https://rubygems.org/gems/temple) | 0.8.0 |
| [`tilt`](https://rubygems.org/gems/tilt) | 2.0.8 |
| [`transproc`](https://rubygems.org/gems/transproc) | 1.0.2 |
| [`url_mount`](https://rubygems.org/gems/url_mount) | 0.2.1 |

## Images Not Tagged `*-no-qt`

The "full" images, i.e., those not with a trailing `-no-qt` in their tag name, also include the following Gems:

| Gem Name | Version |
| -------- | ------- |
| [`addressable`](https://rubygems.org/gems/addressable) | 2.5.2 |
| [`capybara`](https://rubygems.org/gems/capybara) | 2.16.1 |
| [`mini_mime`](https://rubygems.org/gems/mini_mime) | 1.0.0 |
| [`mini_portile2`](https://rubygems.org/gems/mini_portile2) | 2.3.0 |
| [`nokogiri`](https://rubygems.org/gems/nokogiri) | 1.8.1 |
| [`public_suffix`](https://rubygems.org/gems/public_suffix) | 3.0.1 |
| [`rack-test`](https://rubygems.org/gems/rack-test) | 0.8.2 |
| [`rack`](https://rubygems.org/gems/rack) | 2.0.3 |
| [`xpath`](https://rubygems.org/gems/xpath) | 2.1.0 |

# Software

The `capybara` Gem is essential for testing and debugging Web apps. It depends on drivers installed at the OS level; perhaps the most common is [`capybara-webkit`](https://github.com/thoughtbot/capybara-webkit). From the `capybara-webkit` [README](https://github.com/thoughtbot/capybara-webkit):

> capybara-webkit depends on a WebKit implementation from Qt, a cross-platform development toolkit. You'll need to download the Qt libraries to build and install the gem. You can find instructions for downloading and installing Qt on the [capybara-webkit wiki](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit). capybara-webkit requires Qt version 4.8 or greater.

Installing Qt 4 or 5 on Debian Linux brings in well over 100 packages, increasing the image size considerably. While this is necessary for test and, generally, development as well, it is *not* necessary to deploy a production-mode application.

# Additional Documentation

See the [README for the `jdickey/ruby` base image](https://hub.docker.com/r/jdickey/ruby/) and the [official Ruby Docker image docs](https://hub.docker.com/_/ruby/).

# Legal

All files in this repository are Copyright © 2017 by Jeff Dickey, and licensed under the MIT License.

As with all Docker images, these also contain other software which may be under other licenses (such as Ruby, Bash, etc from the base images, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
