Feature: Criar / Remover / Editar usuario comum 
	As: Um usuario da plataforma de compartilhamento de reviews
	I want to: Criar, remover e editar minha conta quando quiser
	So that: Possa navegar pela plataforma e interagir com outros usuários

Scenario: Criar uma nova conta com sucesso
    Given Estou na tela de cadastro
    And Vejo espaços para preenchimento
    When Preencho o campo de "Usuario"
    And Preencho o campo de "Email"
    And Preencho o campo de "Senha" com pelo menos 6 numeros e uma letra
    And Clico no botão de continuar
    Then Continuo na tela de cadastro
    And Vejo mais espaços para preenchimento
    When Preencho o campo de "Nome"
    And Preencho o campo de "Sobrenome"
    And Preencho o campo de "Pronomes"
    And Preencho o campo de "Bio"
    And Confirmo a criacao da conta
    Then Recebo uma confirmacao que minha conta foi criada
    And Vou para página "Inicio" do aplicativo, com minha conta conectado

Scenario: Criar uma conta com informações opcionais faltando
    Given Estou na tela de cadastro
    And Vejo varios espaços para preenchimento
    When Preencho o campo de "Usuario"
    And Preencho o campo de "Email"
    And Preencho o campo de "Senha" com pelo menos 6 numeros e uma letra
    And Clico no botão de continuar
    Then Continuo na tela de cadastro
    And Vejo mais espaços para preenchimento
    When Preencho o campo de "Nome"
    And Preencho o campo de "Sobrenome"
    And Deixo o campo de "Pronomes" em branco
    And Preencho o campo de "Bio"
    And Confirmo a criacao da conta
    Then Recebo uma confirmacao que minha conta foi criada
    And Vou para página "Inicio" do aplicativo, com minha conta conectado