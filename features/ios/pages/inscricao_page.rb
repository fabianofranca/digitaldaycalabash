# coding: utf-8
class InscricaoPage < IOSBasePage
    
    def self.key
        "Inscrição"
    end

    def trait
        "* text:'ENVIAR'"
    end

    def config
        add_element_query "Nome Completo", "* text:'Nome Completo'"
        add_element_query "e-mail", "* text:'E-mail'"
        add_element_query "enviar", "* text:'ENVIAR'"
    end    

end