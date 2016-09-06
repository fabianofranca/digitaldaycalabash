# coding: utf-8
# frozen_string_literal: true

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
end

root_path = File.expand_path('.', Dir.pwd)

# Load features/module
Dir[File.join(root_path, 'features', 'modules', '*.rb')].each do |mod|
  load mod
end

# Load 'features/<platform>/'pages/base_page.rb'
pages_path = 'pages/base_page.rb'
base_page_path = File.join(root_path, 'features', ENV['PLATFORM'], pages_path)
load base_page_path

# Load other pages
Dir[File.join(root_path, 'features', ENV['PLATFORM'], 'pages/*.rb')].each do |p|
  load p if p != base_page_path
end
