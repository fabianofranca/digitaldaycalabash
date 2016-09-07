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

  Pry::Commands.command /^$/, "repeat last command" do
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
Dir[File.join(root_path, 'features', 'cross_platform', '*.rb')].each do |mod|
  load mod
end

# Carregar a page base da plataforma
pages_path = 'pages/page.rb'
base_page_path = File.join(root_path, 'features', ENV['PLATFORM'], pages_path)
load base_page_path

# Carregar as pages por plataforma
Dir[File.join(root_path, 'features', ENV['PLATFORM'], 'pages/*.rb')].each do |p|
  load p if p != base_page_path
end
