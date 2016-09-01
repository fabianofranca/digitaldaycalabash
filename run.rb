#!/usr/bin/env ruby
target = ARGV.shift

if target == 'android'
    exec("bundle exec calabash-android run ../DigitalDay/app/build/outputs/apk/app-debug.apk -p android #{ARGV.join(' ')}")
elsif target == 'ios'
else
  puts "Invalid target #{target}"
end


