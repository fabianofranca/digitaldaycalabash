# coding: utf-8
class InscricaoPage < AndroidBasePage
    
    key "Inscrição"

    trait "* text:'enviar'" 
    
    elements {
        {
            "Nome Completo" => "* id:'input_fullname'",
            "e-mail" => "* id:'input_email'",
            "enviar" => "* text:'enviar'"
        }
    }

end