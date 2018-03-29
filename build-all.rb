#!/usr/bin/env ruby
# frozen_string_literal: true

require 'ostruct'
require 'yaml'

require 'docker'

require_relative './build-image'
require_relative './build_image_list'

def build_actual_image(image_name, image_data)
  repo = 'jdickey/hanami-1.1.1-base'
  dockerfile = DockerfileBuilder.call config: image_data

  print "Building #{image_name}: "
  docker_image = Docker::Image.build(dockerfile, squash: true)
  docker_image.tag(repo: repo, tag: 'latest') if image_data.latest?
  image_data.tags.each { |tag| docker_image.tag repo: repo, tag: tag }
end

images = BuildImageList.call(yaml_file: './builds.yml');
images.each do |image_name, image|
  # We sometimes get Docker timeouts when building; give up to three retries
  retries_left ||= 3
  begin
    build_actual_image(image_name, image)
  rescue Docker::Error::TimeoutError => e
    retries_left -= 1
    print "retrying... " unless retries_left.zero?
    retry unless retries_left.zero?
    puts "Aborting; timeouts exhausted"
  else
    retries_left = 3 # success; reset for the next go
    puts "complete!"
  end
end;
