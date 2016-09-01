#!/usr/bin/env ruby
target = ARGV.shift

if target == 'android'
  exec("bundle exec calabash-android run ../DigitalDay/app/build/outputs/apk/app-debug.apk -p android #{ARGV.join(' ')}")
elsif target == 'ios'
  #WIP
  exec("export APP= && export APP_BUNDLE_PATH=$APP && exec cucumber -p ios #{ARGV.join(' ')}")
else
  puts "Invalid target #{target}"
end


