# Base Images for [Hanami](http://hanamirb.org/) 1.1.1

# Contents

- [Overview](#overview)
- [Images and Supported Tags](#images-and-supported-tags)
  * [Images for Development and Testing](#images-for-development-and-testing)
  * [Images Potentially Suitable for Production](#images-potentially-suitable-for-production)
- [Gems Installed](#gems-installed)
  * [All Images](#all-images)
  * [Images Not Tagged `*-no-hm-*`](#images-not-tagged--no-hm-)
  * [Images Not Tagged `*-no-qt`](#images-not-tagged--no-qt)
- [Software](#software)
- [Additional Documentation](#additional-documentation)
- [Legal](#legal)

# Overview

These images are built from [`jdickey`](https://hub.docker.com/r/jdickey/hanami-1.1.1-base)'s [Customised Ruby Builds](https://github.com/jdickey/docker-ruby), with tags matching [those in the base image](https://hub.docker.com/r/jdickey/docker-ruby/README.md#supported-tags-and-respective-dockerfile-links). This leads to a bit of complexity, as we now have three significant (conceptual) versioned layers that the users of these images should care about: the base operating system (Debian Jessie or Stretch, Alpine); the version of Ruby being used (currently, 2.4.2, 2.4.3, or 2.5.0); and the version of the Hanami framework (here, Version 1.1.1; current as of this writing). Encoding all three version identifiers into a single tag name could lead to tags such as `1.1.1-stretch-2.5.0` or, worse, `1.1.1-2.5.0` (implying "whatever the current default base OS is"). Does anyone *not* have problems with this? Hence, this repo will concern itself with *only* Hanami 1.1.1; future releases of Hanami are expected to be supported by congruently-structured and -tagged *but separate* Docker image repos.

# Images and Supported Tags

As of Version 0.11.1, a new build process is used, using a Ruby CLI-driven script dynamically builds a sequence of in-memory `Dockerfile` text sequences, and builds them dynamically using the [`docker-api`](https://github.com/swipely/docker-api) Gem. While building the `Dockerfile` for a particular image, a sequence of `gem install` commands is `RUN` based on whether the image is or is not built with the `hanami-model` Gem, and whether or not it is built with the [`capybara`](https://github.com/teamcapybara/capybara) Gem, useful for testing. Using `capybara` also requires operating-system support, including the `Qt` GUI toolkit, which adds *significant* size to the image being built.

One consequence of this is that building the entire set of base images takes *significantly* less time as running a sequence of `docker build` command-line invocations (roughly 13 minutes for the current 20 base images, vs 55 minutes for the 17 images supported previously).

Each built image encodes four items of information about itself into its image name:

1. the version of Ruby installed in the image (currently, MRI 2.4.2, 2.4.3, or 2.5.0);

2. the base operating system used to build the image (Debian Jessie, slimmed-down Debian Jessie, Debian Stretch, slimmed-down Debian Stretch, or Alpine 3.7);

3. whether the image includes the `hanami-model` Gem and its supporting Gems (but *not* any specific database-access Gems such as `sqlite` or `pg`); and

4. whether the image includes the Qt windowing toolkit, needed for the Capybara test-automation library and the `capybara-webkit` headless browser.

Examples might be `2.5.0-alpine-hm-no-qt` or `2.4.2-jessie-no-hm-qt`.

Additional tags are created as synonyms for the as-built tags. For example, the `2.4-jessie-hm-qt` tag refers to the *latest* 2.4.*x* Ruby version (currently, 2.4.3). Similarly, the `2-no-hm-no-qt` tag refers to the latest 2.*x* version of Ruby, which is presently 2.5.0 built on Debian Stretch. Finally, tags which do not name a particular base OS (`jessie`, `stretch`, or `alpine`) refer to what has been designated the "default" for a specific Ruby version, which is *generally* in accordance with the defaults for the [official Ruby images](https://hub.docker.com/_/ruby/). `2.4` is a synonym for `2.4.3-jessie-hm-qt`, and `2.5` is a synonym for `2.5.0-alpine-hm-qt`.

The full list of tags follows, as a sequence of lists. Each list starts with the base tag used when that image was first generated. List items below that are alternatives to (aliases for) the base tag. Note that pulling the image without specifying a tag will pull the `latest` image, which is the same image as `2.5.0-stretch-hm-qt`. The alternative tags expected to be most commonly used are listed; however, in general, the use of the base image name is **strongly recommended.**

## Images for Development and Testing

These images are expected to be used more for development and testing than for production deployment, since they include Qt and Capybara, which bloat the images *considerably* but are not orinarily used in production.

Note that the Debian images have "normal" images (`stretch` or `jessie`) as well as "slim" images (`stretch-slim` or `jessie-slim`). The "slim" images have fewer packages installed by default, and thus use less disk space for the base image, but are still considerably larger than equivalent `alpine` images.

* **Base image tag:`2.5.0-alpine3.7-hm-qt`**
  * Common alternative tags:
	  - `2.5.0-alpine`
	  - `2.5-alpine`
	  - `alpine`
  * All tags for image:
	  - `2.5-alpine3.7-hm-qt`
	  - `2-alpine3.7-hm-qt`
	  - `alpine3.7-hm-qt`
	  - `2.5.0-alpine3.7`
	  - `2.5-alpine3.7`
	  - `2-alpine3.7`
	  - `alpine3.7`
	  - `2.5.0-alpine37-hm-qt`
	  - `2.5-alpine37-hm-qt`
	  - `2-alpine37-hm-qt`
	  - `alpine37-hm-qt`
	  - `2.5.0-alpine37`
	  - `2.5-alpine37`
	  - `2-alpine37`
	  - `alpine37`
	  - `2.5.0-alpine-hm-qt`
	  - `2.5-alpine-hm-qt`
	  - `2-alpine-hm-qt`
	  - `alpine-hm-qt`
	  - `2.5.0-alpine`
	  - `2.5-alpine`
	  - `2-alpine`
	  - `alpine`

* **Base image tag:`2.5.0-stretch-hm-qt`**
	* Common alternative tags:
	  * `2.5.0`
	  * `2.5`
	  * `latest`
	* All tags for image:
		* `2.5.0-hm-qt`
		* `2.5-stretch-hm-qt`
		* `2.5-hm-qt`
		* `2-stretch-hm-qt`
		* `2-hm-qt`
		* `stretch-hm-qt`
		* `hm-qt`
		* `2.5-stretch`
		* `2-stretch`
		* `stretch`
		* `2.5.0`
		* `2.5`
		* `2`
		* `latest`

* **Base image tag:`2.5.0-slim-stretch-hm-qt`**
   * Common alternative tags:
      * `2.5.0-slim`
      * `2.5-slim`
      * `slim`
   * All tags for image:
      * `2.5.0-slim-hm-qt`
      * `2.5-slim-stretch-hm-qt`
      * `2.5-slim-hm-qt`
      * `2-slim-stretch-hm-qt`
      * `2-slim-hm-qt`
      * `2-slim-stretch-hm-qt`
      * `2-slim-hm-qt`
      * `slim-stretch-hm-qt`
      * `slim-hm-qt`
      * `2.5-slim-stretch`
      * `2-slim-stretch`
      * `slim-stretch`
      * `2.5.0-slim`
      * `2.5-slim`
      * `2-slim`
      * `slim`

* **Base image tag:`2.4.3-jessie-hm-qt`**
   * Common alternative tags:
      * `2.4.3`
      * `2.4`
   * All tags for image:
      * `2.4-jessie-hm-qt`
      * `2.4.3-hm-qt`
      * `2.4.3`
      * `2.4-hm-qt`
      * `2.4`

* **Base image tag:`2.4.3-slim-jessie-hm-qt`**
   * Common alternative tags:
      * `2.4.3-slim`
      * `2.4-slim`
   * All tags for image:
      * `2.4-slim-jessie-hm-qt`
      * `2.4.3-slim-hm-qt`
      * `2.4-slim-hm-qt`
      * `2.4.3-slim`
      * `2.4-slim`


----

Equivalents without the (generally recommended) [`hanami-model`](https://github.com/hanami/model/) Gem:

* **Base image tag:`2.5.0-alpine3.7-no-hm-qt`**
   * Common alternative tags:
      * `2.5.0-alpine-no-hm`
      * `2.5-alpine-no-hm`
      * `alpine-no-hm`
   * All tags for image:
      * `2.5-alpine3.7-no-hm-qt`
      * `2-alpine3.7-no-hm-qt`
      * `alpine3.7-no-hm-qt`
      * `2.5.0-alpine3.7-no-hm`
      * `2.5-alpine3.7-no-hm`
      * `2-alpine3.7-no-hm`
      * `alpine3.7-no-hm`
      * `2.5.0-alpine37-no-hm-qt`
      * `2.5-alpine37-no-hm-qt`
      * `2-alpine37-no-hm-qt`
      * `alpine37-no-hm-qt`
      * `2.5.0-alpine37-no-hm`
      * `2.5-alpine37-no-hm`
      * `2-alpine37-no-hm`
      * `alpine37-no-hm`
      * `2.5.0-alpine-no-hm-qt`
      * `2.5-alpine-no-hm-qt`
      * `2-alpine-no-hm-qt`
      * `alpine-no-hm-qt`
      * `2.5.0-alpine-no-hm`
      * `2.5-alpine-no-hm`
      * `2-alpine-no-hm`
      * `alpine-no-hm`

* **Base image tag:`2.5.0-stretch-no-hm-qt`**
   * Common alternative tags:
      * `2.5.0-no-hm-qt`
      * `no-hm-qt`
      * `stretch-no-hm`
   * All tags for image:
      * `2.5.0-no-hm-qt`
      * `2.5-stretch-no-hm-qt`
      * `2.5-no-hm-qt`
      * `2-stretch-no-hm-qt`
      * `2-no-hm-qt`
      * `stretch-no-hm-qt`
      * `no-hm-qt`
      * `stretch-no-hm`

* **Base image tag:`2.5.0-slim-stretch-no-hm-qt`**
   * Common alternative tags:
      * `2.5.0-slim-no-hm-qt`
      * `slim-no-hm`
   * All tags for image:
      * `2.5.0-slim-no-hm-qt`
      * `2.5-slim-stretch-no-hm-qt`
      * `2.5-slim-no-hm-qt`
      * `2-slim-stretch-no-hm-qt`
      * `2-slim-no-hm-qt`
      * `2-slim-stretch-no-hm-qt`
      * `2-slim-no-hm-qt`
      * `slim-stretch-no-hm-qt`
      * `slim-no-hm-qt`
      * `slim-no-hm`
      * `2.5-slim-stretch-no-hm`
      * `2-slim-stretch-no-hm`
      * `slim-stretch-no-hm`

* **Base image tag:`2.4.3-jessie-no-hm-qt`**
   * Common alternative tags:
      * `2.4-jessie-no-hm-qt`
      * `2.4.3-no-hm-qt`
      * `2.4-no-hm-qt`
   * All tags for image:
      * `2.4-jessie-no-hm-qt`
      * `2.4.3-no-hm-qt`
      * `2.4-no-hm-qt`

* **Base image tag:`2.4.3-slim-jessie-no-hm-qt`**
   * Common alternative tags:
      * `2.4-slim-jessie-no-hm-qt`
      * `jessie-no-hm-qt`
   * All tags for image:
      * `2.4-slim-jessie-no-hm-qt`
      * `2.4.3-slim-no-hm-qt`
      * `2.4-slim-no-hm-qt`
      * `slim-jessie-no-hm-qt`
      * `jessie-no-hm-qt`

## Images Potentially Suitable for Production

These images *do not* include the Qt GUI libraries, the Capybara testing framework, or the `capybara-webkit` headless-browsing interface for Capybara, and are thus useful when the extra size induced by these packages is undesirable (e.g., in an image being built for production).

* **Base image tag:`2.5.0-alpine3.7-hm-no-qt`**
   * Common alternative tags:
      * `2.5.0-alpine-no-qt`
      * `2.5-alpine-no-qt`
      * `alpine-no-qt`
   * All tags for image:
      * `2.5-alpine3.7-hm-no-qt`
      * `2-alpine3.7-hm-no-qt`
      * `alpine3.7-hm-no-qt`
      * `2.5.0-alpine3.7-no-qt`
      * `2.5-alpine3.7-no-qt`
      * `2-alpine3.7-no-qt`
      * `alpine3.7-no-qt`
      * `2.5.0-alpine37-hm-no-qt`
      * `2.5-alpine37-hm-no-qt`
      * `2-alpine37-hm-no-qt`
      * `alpine37-hm-no-qt`
      * `2.5.0-alpine37-no-qt`
      * `2.5-alpine37-no-qt`
      * `2-alpine37-no-qt`
      * `alpine37-no-qt`
      * `2.5.0-alpine-hm-no-qt`
      * `2.5-alpine-hm-no-qt`
      * `2-alpine-hm-no-qt`
      * `alpine-hm-no-qt`
      * `2.5.0-alpine-no-qt`
      * `2.5-alpine-no-qt`
      * `2-alpine-no-qt`
      * `alpine-no-qt`

* **Base image tag:`2.5.0-stretch-hm-no-qt`**
   * Common alternative tags:
      * `2.5.0-hm-no-qt`
      * `stretch-hm-no-qt`
      * `hm-no-qt`
      * `no-qt`
   * All tags for image:
      * `2.5.0-hm-no-qt`
      * `2.5-stretch-hm-no-qt`
      * `2.5-hm-no-qt`
      * `2-stretch-hm-no-qt`
      * `2-hm-no-qt`
      * `stretch-hm-no-qt`
      * `hm-no-qt`
      * `stretch-hm-no-qt`
      * `stretch-no-qt`
      * `no-qt`

* **Base image tag:`2.5.0-slim-stretch-hm-no-qt`**
   * Common alternative tags:
      * `2.5.0-slim-hm-no-qt`
      * `slim-hm-no-qt`
      * `2.5.0-slim-no-qt`
      * `2.5-slim-no-qt`
      * `slim-no-qt`
   * All tags for image:
      * `2.5.0-slim-hm-no-qt`
      * `2.5-slim-stretch-hm-no-qt`
      * `2.5-slim-hm-no-qt`
      * `2-slim-stretch-hm-no-qt`
      * `2-slim-hm-no-qt`
      * `2-slim-stretch-hm-no-qt`
      * `2-slim-hm-no-qt`
      * `slim-stretch-hm-no-qt`
      * `slim-hm-no-qt`
      * `2.5-slim-stretch-no-qt`
      * `2-slim-stretch-no-qt`
      * `slim-stretch-no-qt`
      * `2.5.0-slim-no-qt`
      * `2.5-slim-no-qt`
      * `2-slim-no-qt`
      * `slim-no-qt`

* **Base image tag:`2.4.3-jessie-hm-no-qt`**
   * Common alternative tags:
      * `2.4.jessie-hm-no-qt`
      * `2.4.3-hm-no-qt`
      * `2.4-hm-no-qt`
   * All tags for image:
      * `2.4.jessie-hm-no-qt`
      * `2.4.3-hm-no-qt`
      * `2.4-hm-no-qt`

* **Base image tag:`2.4.3-slim-jessie-hm-no-qt`**
   * Common alternative tags:
      * `2.4-slim-jessie-hm-no-qt`
      * `2.4.3-slim-hm-no-qt`
      * `2.4-slim-hm-no-qt`
   * All tags for image:
      * `2.4-slim-jessie-hm-no-qt`
      * `2.4.3-slim-hm-no-qt`
      * `2.4-slim-hm-no-qt`

----

As before, equivalents without the (recommended) [`hanami-model`](https://github.com/hanami/model/) Gem:

* **Base image tag:`2.5.0-alpine3.7-no-hm-no-qt`**
   * Common alternative tags:
      * `2.5.0-alpine-no-hm-no-qt`
      * `2.5-alpine-no-hm-no-qt`
      * `alpine-no-hm-no-qt`
   * All tags for image:
      * `2.5-alpine3.7-no-hm-no-qt`
      * `2-alpine3.7-no-hm-no-qt`
      * `alpine3.7-no-hm-no-qt`
      * `2.5.0-alpine37-no-hm-no-qt`
      * `2.5-alpine37-no-hm-no-qt`
      * `2-alpine37-no-hm-no-qt`
      * `alpine37-no-hm-no-qt`
      * `2.5.0-alpine37-no-hm-no-qt`
      * `2.5-alpine37-no-hm-no-qt`
      * `2-alpine37-no-hm-no-qt`
      * `alpine37-no-hm-no-qt`
      * `2.5.0-alpine-no-hm-no-qt`
      * `2.5-alpine-no-hm-no-qt`
      * `2-alpine-no-hm-no-qt`
      * `alpine-no-hm-no-qt`

* **Base image tag:`2.5.0-stretch-no-hm-no-qt`**
   * Common alternative tags:
      * `2.5.0-no-hm-no-qt`
      * `2.5-no-hm-no-qt`
      * `stretch-no-hm-no-qt`
      * `no-hm-no-qt`
   * All tags for image:
      * `2.5.0-no-hm-no-qt`
      * `2.5-stretch-no-hm-no-qt`
      * `2.5-no-hm-no-qt`
      * `2-stretch-no-hm-no-qt`
      * `2-no-hm-no-qt`
      * `stretch-no-hm-no-qt`
      * `no-hm-no-qt`

* **Base image tag:`2.5.0-slim-stretch-no-hm-no-qt`**
   * Common alternative tags:
      * `2.5.0-slim-no-hm-no-qt`
      * `2.5-slim-no-hm-no-qt`
      * `slim-no-hm-no-qt`
   * All tags for image:
      * `2.5.0-slim-no-hm-no-qt`
      * `2.5-slim-stretch-no-hm-no-qt`
      * `2.5-slim-no-hm-no-qt`
      * `2-slim-stretch-no-hm-no-qt`
      * `2-slim-no-hm-no-qt`
      * `slim-no-hm-no-qt`
      * `slim-stretch-no-hm-no-qt`

* **Base image tag:`2.4.3-jessie-no-hm-no-qt`**
   * Common alternative tags:
      * `2.4-jessie-no-hm-no-qt`
      * `2.4.3-no-hm-no-qt`
      * `2.4-no-hm-no-qt`
   * All tags for image:
      * `2.4-jessie-no-hm-no-qt`
      * `2.4.3-no-hm-no-qt`
      * `2.4-no-hm-no-qt`

* **Base image tag:`2.4.3-slim-jessie-no-hm-no-qt`**
   * Common alternative tags:
      * `2.4-slim-jessie-no-hm-no-qt`
      * `2.4.3-slim-no-hm-no-qt`
      * `2.4-slim-no-hm-no-qt`
   * All tags for image:
      * `2.4-slim-jessie-no-hm-no-qt`
      * `2.4.3-slim-no-hm-no-qt`
      * `2.4-slim-no-hm-no-qt`

# Gems Installed

## All Images

These Gems are direct or indirect dependencies of an as-generated skeleton app for [Hanami](http://hanamirb.org) app as of the public release of Version 1.1.1. These images **do not** include the `hanami-model` Gem and its dependencies, nor do the include the `capybara` Gem and _its_ dependencies.

Also, Gems included in the [Ruby base image](https://github.com/jdickey/docker-ruby/) are not listed here.

| Gem Name                                                             | Version |
| -------------------------------------------------------------------- | ------- |
| [`concurrent-ruby`](https://rubygems.org/gems/concurrent-ruby)       | 1.0.5   |
| [`dry-configurable`](https://rubygems.org/gems/dry-configurable)     | 0.7.0   |
| [`dry-container`](https://rubygems.org/gems/dry-container)           | 0.6.0   |
| [`dry-core`](https://rubygems.org/gems/dry-core)                     | 0.4.5   |
| [`dry-equalizer`](https://rubygems.org/gems/dry-equalizer)           | 0.2.0   |
| [`dry-logic`](https://rubygems.org/gems/dry-logic)                   | 0.4.2   |
| [`dry-types`](https://rubygems.org/gems/dry-types)                   | 0.11.1  |
| [`dry-validation`](https://rubygems.org/gems/dry-validation)         | 0.11.0  |
| [`hanami`](https://rubygems.org/gems/gem_name)                       | 1.1.1   |
| [`hanami-assets`](https://rubygems.org/gems/hanami-assets)           | 1.1.1   |
| [`hanami-cli`](https://rubygems.org/gems/hanami-cli)                 | 0.1.1   |
| [`hanami-controller`](https://rubygems.org/gems/hanami-controller)   | 1.1.1   |
| [`hanami-helpers`](https://rubygems.org/gems/hanami-helpers)         | 1.1.1   |
| [`hanami-mailer`](https://rubygems.org/gems/hanami-mailer)           | 1.1.0   |
| [`hanami-router`](https://rubygems.org/gems/hanami-router)           | 1.1.1   |
| [`hanami-utils`](https://rubygems.org/gems/hanami-utils)             | 1.1.2   |
| [`hanami-validations`](https://rubygems.org/gems/hanami-validations) | 1.1.0   |
| [`hanami-view`](https://rubygems.org/gems/hanami-view)               | 1.1.1   |
| [`http_router`](https://rubygems.org/gems/http_router)               | 0.11.2  |
| [`inflecto`](https://rubygems.org/gems/inflecto)                     | 0.0.2   |
| [`mail`](https://rubygems.org/gems/mail)                             | 2.7.0   |
| [`mini_mime`](https://rubygems.org/gems/mini_mime)                   | 1.1.0  |
| [`rack`](https://rubygems.org/gems/rack)                             | 2.0.4  |
| [`tilt`](https://rubygems.org/gems/tilt)                             | 2.0.8   |
| [`transproc`](https://rubygems.org/gems/transproc)                   | 1.0.2   |
| [`url_mount`](https://rubygems.org/gems/url_mount)                   | 0.2.1   |

## Images Not Tagged `*-no-hm-*`

Images built including the `hanami-model` Gem also include the following Gems:

| Gem Name                                                             | Version |
| -------------------------------------------------------------------- | ------- |
| [`dry-initializer`](https://rubygems.org/gems/dry-initializer)       | 1.4.1   |
| [`dry-struct`](https://rubygems.org/gems/dry-struct)                 | 0.3.1   |
| [`hanami-model`](https://rubygems.org/gems/hanami-model)             | 1.1.0   |
| [`ice_nine`](https://rubygems.org/gems/ice_nine)                     | 0.11.2   |
| [`rom`](https://rubygems.org/gems/rom)                               | 3.3.3   |
| [`rom-mapper`](https://rubygems.org/gems/rom-mapper)                 | 0.5.1   |
| [`rom-repository`](https://rubygems.org/gems/rom-repository)         | 1.4.0   |
| [`rom-sql`](https://rubygems.org/gems/rom-sql)                       | 1.3.5   |
| [`sequel`](https://rubygems.org/gems/sequel)                         | 4.49.0 |

**Note** that as of Gem version 1.1.0, `hanami-model` *only* supports SQL-based databases, hence `rom-sql`. Also note that the Sequel Gem version is significantly outdated; at this writing, the current version of `sequel` is 5.6.0. Support for ROM Version 5+ is anticipated for `hanami-model` 2.0.0, expected in 2Q-3Q 2018.

## Images Not Tagged `*-no-qt`

Images built including the `capybara` Gem and its dependencies also include the following Gems:

The "full" images, i.e., those not with a trailing `-no-qt` in their tag name, also include the following Gems:

| Gem Name                                                   | Version |
| ---------------------------------------------------------- | ------- |
| [`addressable`](https://rubygems.org/gems/addressable)     | 2.5.2   |
| [`capybara`](https://rubygems.org/gems/capybara)           | 2.16.1  |
| [`mini_mime`](https://rubygems.org/gems/mini_mime)         | 1.0.0   |
| [`mini_portile2`](https://rubygems.org/gems/mini_portile2) | 2.3.0   |
| [`nokogiri`](https://rubygems.org/gems/nokogiri)           | 1.8.2   |
| [`public_suffix`](https://rubygems.org/gems/public_suffix) | 3.0.1   |
| [`rack`](https://rubygems.org/gems/rack)                   | 2.0.3   |
| [`rack-test`](https://rubygems.org/gems/rack-test)         | 0.8.3   |
| [`xpath`](https://rubygems.org/gems/xpath)                 | 3.0.0   |

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
