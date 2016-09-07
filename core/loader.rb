# coding: utf-8
# frozen_string_literal: true

# Ferramenta da debug
if ENV['DEBUG']
  require 'pry'

  if defined?(PryByebug)
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
  end

  Pry::Commands.command(/^$/, 'repeat last command') do
    _pry_.run_command Pry.history.to_a.last
  end
end

# Adiciona dependencias para cada plataforma
if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
  require 'calabash-cucumber/calabash_steps'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
  require 'calabash-android/calabash_steps'
end

root_path = File.expand_path('.', Dir.pwd)

# Carregar classes utilizados em ambas plataformas
Dir[File.join(root_path, 'cross_platform', '*.rb')].each do |cross_file|
  load cross_file
end

# Carregar a page base da plataforma
base_page_file = File.join(root_path, ENV['PLATFORM'], 'page.rb')
load base_page_file

# Carregar as pages por plataforma
Dir[File.join(root_path, ENV['PLATFORM'], '*.rb')].each do |page_file|
  load page_file if page_file != base_page_file
end
