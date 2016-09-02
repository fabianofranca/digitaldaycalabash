# coding: utf-8
class InscricaoPage < IOSBasePage
    
    key "Inscrição"

    trait "* text:'ENVIAR'"

    elements {
        {
            "Nome Completo" => "* text:'Nome Completo'",
            "e-mail" => "* text:'E-mail'",
            "enviar" => "* text:'ENVIAR'"
        }
    }

end