# language: pt

@cadastros
Funcionalidade: Cadastrar cliente
Como QA preciso garantir que o cadastro de clientes esteja funcionando corertamente

    Contexto: cadastar um cliente
      Dado clicar para cadastrar um novo Cliente

	@cadastrook
	Esquema do Cenario: Cadastro com sucesso
	  Quando preencher todos dados para um cadastro '<tipo>' e concluir
      Então deve visualizar a '<mensagem>'
		Exemplos:
		  | tipo     | mensagem                       |
		  | Básico   | Cadastro efetuado com sucesso  |
		  | Completo | Cadastro efetuado com sucesso  |
    
    @excluircadastro
    Esquema do Cenário: Excuir um cliente
      Quando preencher todos dados para um cadastro '<tipo>' e concluir
      Então deve visualizar a '<mensagem>'
      E confirmar o popup sendo direcionado para home novamente
      Quando clicar no usuario recem cadastrado
      Então clicar para excluir deve se visualizar a '<msg do popup>'
      E a mensagem '<msg exclusao>'
        Exemplos:
		  | tipo     | mensagem                       | msg do popup                                  | msg exclusao                  |
		  | Básico   | Cadastro efetuado com sucesso  | Tem certeza que deseja excluir este cadastro? | Cadastro excluído com sucesso |
		  | Completo | Cadastro efetuado com sucesso  | Tem certeza que deseja excluir este cadastro? | Cadastro excluído com sucesso |