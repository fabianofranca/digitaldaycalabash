# coding: utf-8
require 'calabash-android/abase'

class AndroidBasePage < Calabash::ABase
    include BaseModule

    def set_field(query, value)
        touch_item(query)
        wait_for(timeout: 30) { keyboard_visible? }
        keyboard_enter_text(value)
        hide_soft_keyboard if keyboard_visible?
        wait_for(timeout: 30) { !keyboard_visible? }
    end

end