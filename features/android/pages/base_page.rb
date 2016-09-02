# coding: utf-8
require 'calabash-android/abase'

class AndroidBasePage < Calabash::ABase
    include Page

    def set_field(key_or_query, value)
        query = get_element_query(key_or_query)        
        query = key_or_query if query.nil?

        enter_text query, value
        hide_soft_keyboard if keyboard_visible?
        wait_for(timeout: 30) { !keyboard_visible? }
    end
end