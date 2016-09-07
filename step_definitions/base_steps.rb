# coding: utf-8
# frozen_string_literal: true

Dado(/^(?:que estou na|sou redirecionado para) tela "([^"]*)"$/) do |key|
  @page = page(Core::Page.get(key)).await
end

Quando(/^toco no botão "([^"]*)"$/) do |botao|
  @page.touch_item botao
end

Dado(/^preencho o campo "([^"]*)" com o valor "([^"]*)"$/) do |campo, valor|
  @page.set_field campo, valor
end

Então(/^visualizo a mensagem "([^"]*)"$/) do |mensagem|
  @page.text? mensagem
end
