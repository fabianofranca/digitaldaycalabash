# coding: utf-8
# frozen_string_literal: true

##
# Esta classe representa a tela de Inscricao
class InscricaoPage < IOSBasePage
  key 'Inscrição'

  trait "* text:'ENVIAR'"

  elements 'Nome Completo' => "* text:'Nome Completo'",
           'e-mail' => "* text:'E-mail'",
           'enviar' => "* text:'ENVIAR'"
end
