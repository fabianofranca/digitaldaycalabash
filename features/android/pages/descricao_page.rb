# coding: utf-8
class DescricaoPage < AndroidBasePage

    def self.key
        "Descrição"
    end

    def trait
        "* text:'inscrever-se'"
    end

    def config
        add_element_query "inscrever-se", "* text:'inscrever-se'"    
    end
end