# language: pt
@inscricao
Funcionalidade: Realizar inscrição no Digital Day

Essa funcionalide permite ao usuário se inscrever no evento

  @inscricao_fluxo_normal
  Cenário: Fluxo nomal de inscrição
    Dado que estou na tela de descrição
    E toco no botão "inscrever-se"
    E sou redirecionado para tela de inscrição
    E preencho o campo "Nome Completo" com o valor "Fabiano França"
    E preencho o campo "e-mail" com o valor "email@fabianofranca.com"
    Quando toco no botão "enviar"
    Então sou redirecionado para tela de agradecimento

  @inscricao_fluxo_alternativo
  Cenário: Fluxo alternativo de inscrição
    Dado que estou na tela de descrição
    E toco no botão "inscrever-se"
    E sou redirecionado para tela de inscrição
    E toco no botão "enviar"
    Então visualizo a mensagem "Informe seu nome completo"
    Quando preencho o campo "Nome Completo" com o valor "Fabiano França"
    E toco no botão "enviar"
    Então visualizo a mensagem "Informe um e-mail válido"
    Quando preencho o campo "e-mail" com o valor "email@fabianofranca.com"
    E toco no botão "enviar"
    Então sou redirecionado para tela de agradecimento