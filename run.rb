#!/usr/bin/env ruby
target = ARGV.shift

if target == 'android'
  exec("bundle exec calabash-android run apps/android.apk -p android #{ARGV.join(' ')}")
elsif target == 'ios'
  exec("export APP_BUNDLE_PATH=apps/ios.app && exec cucumber -p ios #{ARGV.join(' ')}")
else
  puts "Invalid target #{target}. Use 'android' or 'ios'."
end