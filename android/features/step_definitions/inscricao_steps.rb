# coding: utf-8

Dado(/^que estou na tela de descrição$/) do
  wait_for(timeout: 5) { element_exists "* text:'inscrever-se'" }
end

Quando(/^toco no botão "([^"]*)"$/) do |botao|
  touch "* text:'#{botao}'"
end

Dado(/^sou redirecionado para tela de inscrição$/) do
  wait_for(timeout: 5) { element_exists "* text:'enviar'" }
end

Dado(/^preencho o campo "([^"]*)" com o valor "([^"]*)"$/) do |campo, valor|
  touch "* id:'#{getId(campo)}'"
  keyboard_enter_text(valor)
  hide_soft_keyboard if keyboard_visible?
end

Então(/^sou redirecionado para tela de agradecimento$/) do
  wait_for(timeout: 5) { element_exists "* text:'Obrigado!'" }
end

Então(/^visualizo a mensagem "([^"]*)"$/) do |mensagem|
  wait_for(timeout: 5) { element_exists "* text:'#{mensagem}'" }
end