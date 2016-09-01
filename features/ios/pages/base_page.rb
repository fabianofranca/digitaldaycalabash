# coding: utf-8
require 'calabash-cucumber/ibase'

class IOSBasePage < Calabash::IBase
    include BaseModule

    def set_field(query, value)
        raise "Não implementado"
    end

end