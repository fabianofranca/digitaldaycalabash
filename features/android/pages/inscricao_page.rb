# coding: utf-8
# frozen_string_literal: true

##
# Esta classe representa a tela de Inscricao
class InscricaoPage < AndroidBasePage
  key 'Inscrição'

  trait "* text:'enviar'"

  elements 'Nome Completo' => "* id:'input_fullname'",
           'e-mail' => "* id:'input_email'",
           'enviar' => "* text:'enviar'"
end
