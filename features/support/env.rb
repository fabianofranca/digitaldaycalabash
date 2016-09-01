if ENV['PLATFORM'] == 'ios'
	  require 'calabash-cucumber/cucumber'
elsif ENV['PLATFORM'] == 'android'
	  require 'calabash-android/cucumber'
end

root_path = File.expand_path('.', Dir.pwd)

Dir[File.join(root_path, 'features', 'modules', '*.rb')].each do |mod|
  load mod
end

load File.join(root_path, 'features', ENV['PLATFORM'], 'pages/base_page.rb')
