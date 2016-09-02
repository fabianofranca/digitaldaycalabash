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
base_page_path = File.join(root_path, 'features', ENV['PLATFORM'], 'pages/base_page.rb')
load base_page_path

# Load other pages
Dir[File.join(root_path, 'features', ENV['PLATFORM'], 'pages/*.rb')].each do |pag|
  load pag if pag != base_page_path
end