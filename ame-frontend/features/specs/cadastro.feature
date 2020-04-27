# language: pt

Funcionalidade: Realizar um novo cadastro

	@authpage? @cadastro
	Cenario: Cadastro de um novo usuário
	  Dado cadastrar preenchendo todos dados
	  Então deve logar e ir para a pagina da minha conta