# coding: utf-8

Dado(/^que estou na tela de descrição$/) do
  wait_for(timeout: 5) { element_exists "* text:'INSCREVER-SE'" }
end

Quando(/^toco em "([^"]*)"$/) do |botao|
  touch "* text:'#{botao}'"
end

Dado(/^sou redirecionado para tela de inscrição$/) do
  wait_for(timeout: 5) { element_exists "* text:'ENVIAR'" }
end

Dado(/^preencho o campo "([^"]*)" com o valor "([^"]*)"$/) do |campo, valor|
  wait_for(timeout: 5) { element_exists "* text:'#{campo}'" }
  touch "* text:'#{campo}'"
  wait_for(timeout: 30) { keyboard_visible? }
  keyboard_enter_text(valor)
end

Então(/^sou redirecionado para tela de agradecimento$/) do
  wait_for(timeout: 5) { element_exists "* text:'OBRIGADO!'" }
end

Então(/^visualizo a mensagem "([^"]*)"$/) do |mensagem|
  wait_for(timeout: 5) { element_exists "* text:'#{mensagem}'" }
end