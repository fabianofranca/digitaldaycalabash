# coding: utf-8
# frozen_string_literal: true

##
# Esta classe representa a tela de Descricao
class DescricaoPage < Android::Page
  key 'Descrição'

  trait "* text:'inscrever-se'"

  elements 'inscrever-se' => "* text:'inscrever-se'"
end
