Dado(/^que estou na tela "([^"]*)"$/) do |page|
  @page = getPage(page)
end

Dado(/^sou redirecionado para tela "([^"]*)"$/) do |page|
  step "que estou na tela \"#{page}\""
end

Quando(/^toco no botão "([^"]*)"$/) do |botao|
  @page.touch_item("* text:'#{botao}'")
end

Dado(/^preencho o campo "([^"]*)" com o valor "([^"]*)"$/) do |campo, valor|
  @page.set_field("* id:'#{getId(campo)}'", valor)
end

Então(/^visualizo a mensagem "([^"]*)"$/) do |mensagem|
  @page.has_text(mensagem)
end