#!/usr/bin/env ruby
target = ARGV.shift

if target == 'android'
  exec("bundle exec calabash-android run ../DigitalDay/app/build/outputs/apk/app-debug.apk -p android #{ARGV.join(' ')}")
elsif target == 'ios'
  #WIP
  exec("export APP_BUNDLE_PATH=/Users/rodrigogd/Library/Developer/Xcode/DerivedData/DigitalDay-dmsnxnxrewwmfccdzahhcnxkzhnb/Build/Products/Debug-iphonesimulator/DigitalDay-cal.app && exec cucumber -p ios #{ARGV.join(' ')}")
else
  puts "Invalid target #{target}. Use 'android' or 'ios'."
end

