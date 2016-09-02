# coding: utf-8
class InscricaoPage < AndroidBasePage
    
    def self.key
        "Inscrição"
    end

    def trait
        "* text:'enviar'"
    end

    def config
        add_element_query "Nome Completo", "* id:'input_fullname'"
        add_element_query "e-mail", "* id:'input_email'"
        add_element_query "enviar", "* text:'enviar'"
    end

end