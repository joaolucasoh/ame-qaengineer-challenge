# language: pt

@cadastroempregado
Funcionalidade: Cadastrar empregado
    
Esquema do Cenário: Cadastrar novo empregado
    Dado que realize o cadastro de um novo empregado
    Então devo ter o retorno com o '<status>'
    Exemplos:
        | status |
        | 200    |