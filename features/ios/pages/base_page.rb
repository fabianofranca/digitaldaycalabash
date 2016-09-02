# coding: utf-8
require 'calabash-cucumber/ibase'

class IOSBasePage < Calabash::IBase
    include Page

    def set_field(key_or_query, value)
        touch_item key_or_query
        wait_for_keyboard
        keyboard_enter_text(value)        
    end

end