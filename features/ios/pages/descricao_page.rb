# coding: utf-8
class DescricaoPage < IOSBasePage

    key "Descrição"
    
    trait "* text:'INSCREVER-SE'"

    elements {
        { "inscrever-se" => "* text:'INSCREVER-SE'" }    
    }
end