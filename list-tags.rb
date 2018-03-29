#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './build-image'
require_relative './build_image_list'

def report_on(base_tag, synonyms)
  lead = ' ' * 3

  puts "* **Base image tag:`#{base_tag}`**"
  puts lead + '* Common alternative tags:'
  synonyms.each { |item| puts lead * 2 + "* `#{item}`" }
  puts lead + '* All tags for image:'
  synonyms.each { |item| puts lead * 2 + "* `#{item}`" }
  puts "\n"
end

images = BuildImageList.call(yaml_file: './builds.yml');
all_tags = {}
images.each { |image_name, image| all_tags[image_name] = image.tags }
no_hm_prod = all_tags.select { |tag, _| tag.match?(/-no-hm-no-qt$/) }
no_hm_dev = all_tags.select { |tag, _| tag.match?(/-no-hm-qt$/) }
all_tags.delete_if do |tag, _|
  tag.match?(/-no-hm-qt$/) || tag.match?(/-no-hm-no-qt$/)
end
hm_prod = all_tags.select { |tag, _| tag.match?(/-hm-no-qt$/) }
hm_dev = all_tags.select { |tag, _| tag.match?(/-hm-qt$/) }

hm_dev.each { |base_tag, synonyms| report_on(base_tag, synonyms) };
puts "----\n\n"
no_hm_dev.each { |base_tag, synonyms| report_on(base_tag, synonyms) };
puts "----\n\n"
hm_prod.each { |base_tag, synonyms| report_on(base_tag, synonyms) };
puts "----\n\n"
no_hm_prod.each { |base_tag, synonyms| report_on(base_tag, synonyms) };
