PAGES = {
  "Descrição" => "DescricaoPage",
  "Inscrição" => "InscricaoPage",
  "Agradecimento" => "AgradecimentoPage"
}

def getPage(value)  
  page(Object.const_get(PAGES[value])).await()  
end