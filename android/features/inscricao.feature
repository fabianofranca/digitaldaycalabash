# language: pt
@inscricao
Funcionalidade: Realizar inscrição no Digital Day

  Essa funcionalide permite ao usuário se inscrever no evento
  
  Contexto:
    Dado que estou na tela de descrição
    E toco em "inscrever-se"
    E sou redirecionado para tela de inscrição

  @inscricao_fluxo_normal
  Cenário: Fluxo nomal de inscrição
    E preencho o campo "input_fullname" com o valor "Fabiano França"
    E preencho o campo "input_email" com o valor "email@fabianofranca.com"
    Quando toco em "enviar"
    Então sou redirecionado para tela de agradecimento

  @inscricao_fluxo_alternativo
  Cenário: Fluxo alternativo de inscrição
    E toco em "enviar"
    Então visualizo a mensagem "Informe seu nome completo"
    Quando preencho o campo "input_fullname" com o valor "Fabiano França"
    E toco em "enviar"
    Então visualizo a mensagem "Informe um e-mail válido"
    Quando preencho o campo "input_email" com o valor "email@fabianofranca.com"
    E toco em "enviar"
    Então sou redirecionado para tela de agradecimento

  @inscricao_fluxo_normal_esquema
  Esquema do Cenário: Fluxo nomal de inscrição (Esquema)
    E preencho o campo "input_fullname" com o valor "<Nome>"
    E preencho o campo "input_email" com o valor "<Email>"
    Quando toco em "enviar"
    Então sou redirecionado para tela de agradecimento

    Exemplos:
    | Nome           | Email                   |
    | Fabiano França | email@fabianofranca.com | 
    | Pedro Luiz     | pedro.luiz@gmail.com    |
