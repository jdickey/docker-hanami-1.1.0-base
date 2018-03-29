# frozen_string_literal: true

class ImageItem
  def initialize(base_os:, hanami_version:, hm:, image_version:, qt:,
                 ruby_version:, tags:, latest: false,
                 maintainer: DEFAULT_MAINTAINER)
    @base_os = base_os
    @hanami_version = hanami_version
    @hm = (hm == 'no-hm') ? 'no-hm' : 'hm'
    @image_version = image_version
    @latest = !!latest
    @maintainer = maintainer
    @qt = (qt == 'no-qt') ? 'no-qt' : 'qt'
    @ruby_version = ruby_version
    @tags = Array(tags)
    @tags.freeze
    freeze
  end

  attr_reader :base_os, :hanami_version, :image_version, :maintainer,
              :ruby_version, :tags

  def alpine?
    base_os.match?(/^alpine/)
  end

  def base_image_spec
    common_ret = "#{BASE_REPO}:#{ruby_version}-#{base_os}"
    return common_ret if qt?
    common_ret + '-no-qt'
  end

  def build_tag_name
    [ruby_version, base_os, @hm, @qt].join('-')
  end

  def debian?
    DEBIAN_OS_NAMES.include? base_os
  end

  def hm?
    @hm != 'no-hm'
  end

  def latest?
    @latest
  end

  def qt?
    @qt != 'no-qt'
  end

  def upgrade_cmd
    return 'apk --no-cache upgrade' if alpine?
    ['apt-get update -qq', 'apt-get dist-upgrade -y', 'apt-get clean',
     'find /var/lib/apt/lists/* -delete'].join(' && ')
  end

  BASE_REPO = 'jdickey/ruby'
  DEBIAN_OS_NAMES = %w(slim-jessie slim-stretch jessie stretch).freeze
  DEFAULT_MAINTAINER = 'Jeff Dickey <jdickey at seven-sigma dot com>'
end # class ImageItem
