# language: pt

@logins
Funcionalidade: Login
Como QA preciso garantir que o login esteja devidamente funcional, incluindo os tratamentos de erro.

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

    @authpage? @emailinvalido
	Esquema do Cenário: Logar com email em formato inválido
		Quando inserir o '<email>'
		Então retornara a seguinte '<mensagem>'
		Exemplos:
			| email 	       | mensagem                   |
			| 1234567890       | Invalid email address.     |
			| ame123           | Invalid email address.     |
			| cashback@2020    | Invalid email address.     |
			| euqanaame@email. | Invalid email address.     |
			| joaoqa#@.daame   | Invalid email address.     |
			|                  | An email address required. |
	
	@authpage? @esquecisenha
	Esquema do Cenário: Esqueci a senha com email cadastrado e não cadastrado
		Quando clicar em Esqueci a senha
		E inserir o '<email>' cadastrado ou não
		Então retornara a seguinte '<mensagem>' de recuperação
		Exemplos:
			| email 					     | mensagem 			   															  |
			| iventis.joao@hubfintech.com.br | A confirmation email has been sent to your address: iventis.joao@hubfintech.com.br |
			| joao.lucas@amedigital.com.br   | There is no account registered for this email address. 							  |

	@authpage? @login_ok
	Esquema do Cenário: Logar com email e senha validos
		Quando logar com o '<email>' e a '<senha>'
		Então deve logar e ir para a pagina da minha conta
		Exemplos:
			| email							  | senha	  |
			| iventis.joao@hubfintech.com.br  | mudar@123 |
	