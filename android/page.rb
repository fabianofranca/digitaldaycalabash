# coding: utf-8
# frozen_string_literal: true

require 'calabash-android/abase'

module Android
  ##
  # Esta classe e utilizada para definir metodos reutilizaveis no Android e traz
  # metodos reutilizaveis cross-plataforma atraves do include
  class Page < Calabash::ABase
    include CrossPlatform::Page

    def set_field(key_or_query, value)
      query = get_element_query(key_or_query)
      query = key_or_query if query.nil?

      enter_text query, value
      hide_soft_keyboard if keyboard_visible?
      wait_for(timeout: 30) { !keyboard_visible? }
    end
  end
end
