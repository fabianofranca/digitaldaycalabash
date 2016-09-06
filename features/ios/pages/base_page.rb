# coding: utf-8
# frozen_string_literal: true
require 'calabash-cucumber/ibase'

##
# Esta classe e utilizada para definir metodos reutilizaveis no iOS e traz
# metodos reutilizaveis cross-plataforma atraves do include do module Page
class IOSBasePage < Calabash::IBase
  include Page

  def set_field(key_or_query, value)
    touch_item key_or_query
    wait_for_keyboard
    keyboard_enter_text value
  end
end
