# language: pt

Funcionalidade: Realizar um novo cadastro

	Contexto: Acessar a tela de login
		Dado esteja na home page

	@authpage? @login_nok
	Esquema do Cenario: Login com insucesso
		Quando logar com o '<usuario>' e a '<senha>'
		Então retornara a seguinte '<mensagem>'
		Exemplos:
			| usuario            | senha      | mensagem       		  |
			| amedigital@ame.com | amedigital | Authentication failed.|
			|  ame@b2w.com.br    |            | Password is required. |