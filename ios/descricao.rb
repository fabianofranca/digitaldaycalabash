# coding: utf-8
# frozen_string_literal: true

##
# Esta classe representa a tela de Descricao
class DescricaoPage < IOS::Page
  key 'Descrição'

  trait "* text:'INSCREVER-SE'"

  elements 'inscrever-se' => "* text:'INSCREVER-SE'"
end