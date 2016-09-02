# language: pt
@inscricao
Funcionalidade: Realizar inscrição no Digital Day

  Essa funcionalide permite ao usuário se inscrever no evento
  
  Contexto:
    Dado que estou na tela de descrição
    E toco no botão "INSCREVER-SE"
    E sou redirecionado para tela de inscrição

  @inscricao_fluxo_normal
  Cenário: Fluxo nomal de inscrição
    E preencho o campo "Nome Completo" com o valor "Fabiano Franca"
    E preencho o campo "E-mail" com o valor "email@fabianofranca.com"
    Quando toco no botão "ENVIAR"
    Então sou redirecionado para tela de agradecimento

  @inscricao_fluxo_alternativo
  Cenário: Fluxo alternativo de inscrição
    E toco no botão "ENVIAR"
    Então visualizo a mensagem "Informe seu nome completo"
    Quando preencho o campo "Nome Completo" com o valor "Fabiano Franca"
    E toco no botão "ENVIAR"
    Então visualizo a mensagem "Informe um e-mail válido"
    Quando preencho o campo "E-mail" com o valor "email@fabianofranca.com"
    E toco no botão "ENVIAR"
    Então sou redirecionado para tela de agradecimento

  @inscricao_fluxo_normal_esquema
  Esquema do Cenário: Fluxo nomal de inscrição (Esquema)
    E preencho o campo "Nome Completo" com o valor "<Nome>"
    E preencho o campo "E-mail" com o valor "<Email>"
    Quando toco no botão "ENVIAR"
    Então sou redirecionado para tela de agradecimento

    Exemplos:
    | Nome           | Email                   |
    | Fabiano Franca | email@fabianofranca.com | 
    | Pedro Luiz     | pedro.luiz@gmail.com    |