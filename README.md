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

These images are built from [`jdickey`](https://hub.docker.com/r/jdickey/hanami-1.1.0-base)'s [Customised Ruby Builds](https://github.com/jdickey/docker-ruby), with tags matching [those in the base image](https://hub.docker.com/r/jdickey/docker-ruby/README.md#supported-tags-and-respective-dockerfile-links). This leads to a bit of complexity, as we now have three significant (conceptual) versioned layers that the users of these images should care about: the base operating system (Debian Jessie or Stretch, Alpine); the version of Ruby being used (currently, 2.4.4 or 2.5.1); and the version of the Hanami framework (here, Version 1.1.0). Encoding all three version identifiers into a single tag name could lead to tags such as `1.1.0-stretch-2.5.0` or, worse, `1.1.0-2.5.0` (implying "whatever the current default base OS is"). Does anyone *not* have problems with this? Hence, this repo will concern itself with *only* Hanami 1.1.0; future releases of Hanami are expected to be supported by congruently-structured and -tagged *but separate* Docker image repos.

# Supported Tags and Respective Dockerfile Links

This repository includes tags matching [those in the base image](https://hub.docker.com/r/jdickey/docker-ruby/README.md#supported-tags-and-respective-dockerfile-links), from which the images are built. The Dockerfiles are

* `2.5.1-stretch`, `2.5-stretch`, `2-stretch`, `stretch`, `2.5.1`, `2.5`, `2`, `latest` ([*2.5.1/stretch/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.1/stretch/Dockerfile))
* `2.5.1-stretch-no-qt`, `2.5-stretch-no-qt`, `2-stretch-no-qt`, `stretch-no-qt`, `2.5.1-no-qt`, `2.5-no-qt`, `2-no-qt` ([*2.5.1/stretch/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.1/stretch/no-qt/Dockerfile))
* `2.5.1-stretch-slim`, `2.5-stretch-slim`, `2-stretch-slim`, `stretch-slim`, `2.5.1-slim`, `2.5-slim` ([*2.5.1/stretch/slim/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.1/stretch/slim/Dockerfile))
* `2.5.1-stretch-slim-no-qt`, `2.5-stretch-slim-no-qt`, `2-stretch-slim-no-qt`, `stretch-slim-no-qt`, `2.5.1-slim-no-qt`, `2.5-slim-no-qt`, `2-slim-no-qt`, `slim-no-qt` ([*2.5.1/stretch/slim/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.1/stretch/slim/no-qt/Dockerfile))
* `2.5.1-alpine`, `2.5-alpine`, `2-alpine`, `alpine` ([*2.5.1/stretch/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.1/stretch/Dockerfile))
* `2.5.1-alpine-no-qt`, `2.5-alpine-no-qt`, `2-alpine-no-qt`, `alpine-no-qt` ([*2.5.1/alpine/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.1/alpine/no-qt/Dockerfile))
* `2.5.0-stretch`, `2.5.0` ([*2.5.0/stretch/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.0/stretch/Dockerfile))
* `2.5.0-stretch-no-qt`, `2.5.0-no-qt` ([*2.5.0/stretch/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.0/stretch/no-qt/Dockerfile))
* `2.5.0-stretch-slim`, `2.5.0-slim` ([*2.5.0/stretch/slim/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.0/stretch/slim/Dockerfile))
* `2.5.0-stretch-slim-no-qt`, `2.5.0-slim-no-qt` ([*2.5.0/stretch/slim/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.0/stretch/slim/no-qt/Dockerfile))
* `2.5.0-alpine` ([*2.5.0/stretch/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.0/stretch/Dockerfile))
* `2.5.0-alpine-no-qt` ([*2.5.0/alpine/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.5.0/alpine/no-qt/Dockerfile))
* `2.4.4-jessie`, `2.4-jessie`, `2.4.4`, `2.4` ([*2.4.4/jessie/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.4/jessie/Dockerfile))
* `2.4.4-jessie-no-qt`, `2.4-jessie-no-qt`, `2.4.4-no-qt`, `2.4-no-qt` ([*2.4.4/jessie/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.4/jessie/no-qt/Dockerfile))
* `2.4.4-jessie-slim`, `2.4-jessie-slim`, `2.4.4-slim`, `2.4-slim` ([*2.4.4/jessie/slim/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.4/jessie/slim/Dockerfile))
* `2.4.4-jessie-slim-no-qt`, `2.4-jessie-slim-no-qt`, `2.4.4-slim-no-qt`, `2.4-slim-no-qt` ([*2.4.4/jessie/slim/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.4/jessie/slim/no-qt/Dockerfile))
* `2.4.3-jessie` ([*2.4.3/jessie/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.3/jessie/Dockerfile))
* `2.4.3-jessie-no-qt`, `2.4.3-no-qt` ([*2.4.3/jessie/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.3/jessie/no-qt/Dockerfile))
* `2.4.3-jessie-slim`, `2.4.3-slim` ([*2.4.3/jessie/slim/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.3/jessie/slim/Dockerfile))
* `2.4.3-jessie-slim-no-qt`, `2.4.3-slim-no-qt` ([*2.4.3/jessie/slim/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.3/jessie/slim/no-qt/Dockerfile))
* `2.4.2-jessie`, `2.4.2` ([*2.4.2/jessie/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.2/jessie/Dockerfile))
* `2.4.2-jessie-no-qt`, `2.4.2-no-qt` ([*2.4.2/jessie/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.2/jessie/no-qt/Dockerfile))
* `2.4.2-jessie-slim`, `2.4.2-slim` ([*2.4.2/jessie/slim/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.2/jessie/slim/Dockerfile))
* `2.4.2-jessie-slim-no-qt`, `2.4.2-slim-no-qt` ([*2.4.2/jessie/slim/no-qt/Dockerfile*](https://github.com/jdickey/docker-hanami-1.1.0-base/blob/master/2.4.2/jessie/slim/no-qt/Dockerfile))

For more information on the naming conventions, variations, and so on, see the [base image documentation](https://hub.docker.com/r/jdickey/docker-ruby/README.md#supported-tags-and-respective-dockerfile-links).

# Gems Installed

## All Images

These images install the [`hanami`](http://hanamirb.org) and `hanami-model` Gems, both Version 1.1.0, as well as the *current versions at build time* of:

* `minitest`;
* `shotgun`; and
* `slim`

Though these images include `hanami-model` and its dependencies, including `rom` and `rom-repository`, **no database-specific interface Gem is included**. Your app **must** include appropriate Gems for accessing your database engine of choice,  such as [`pg`](https://rubygems.org/gems/pg) or [`sqlite3`](https://rubygems.org/gems/sqlite3). By omitting those, these images can be used as the *base* images for apps using *any* Hanami-supported database engine.

## Images Not Tagged `*-no-qt`

The "full" images, i.e., those not with a trailing `-no-qt` in their tag name, also include the [`capybara`](https://rubygems.org/gems/capybara) Gem and its dependencies, as well as operating-system support for the `webkit-capybara` headless browser. The version of Capybara installed was current as of the date these images were built.

# Software

The `capybara` Gem is essential for testing and debugging Web apps. It depends on drivers installed at the OS level; perhaps the most common is [`capybara-webkit`](https://github.com/thoughtbot/capybara-webkit). From the `capybara-webkit` [README](https://github.com/thoughtbot/capybara-webkit):

> capybara-webkit depends on a WebKit implementation from Qt, a cross-platform development toolkit. You'll need to download the Qt libraries to build and install the gem. You can find instructions for downloading and installing Qt on the [capybara-webkit wiki](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit). capybara-webkit requires Qt version 4.8 or greater.

Installing Qt 4 or 5 on Debian Linux brings in well over 100 packages, increasing the image size considerably. While this is necessary for test and, generally, development as well, it is *not* necessary to deploy a production-mode application.

# Additional Documentation

See the [README for the `jdickey/ruby` base image](https://hub.docker.com/r/jdickey/ruby/) and the [official Ruby Docker image docs](https://hub.docker.com/_/ruby/).

# Legal

All files in this repository are Copyright © 2018 by Jeff Dickey, and licensed under the MIT License.

As with all Docker images, these also contain other software which may be under other licenses (such as Ruby, Bash, etc from the base images, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
