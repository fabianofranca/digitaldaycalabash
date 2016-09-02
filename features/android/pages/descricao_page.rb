# coding: utf-8
class DescricaoPage < AndroidBasePage

    key "Descrição"

    trait "* text:'inscrever-se'" 

    elements {
        { "inscrever-se" => "* text:'inscrever-se'" }
    }
end