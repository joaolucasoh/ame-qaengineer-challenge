# frozen_string_literal: true

Dado('clicar para cadastrar um novo Cliente') do
  @screen.cadastro.start_cadastro
end

Quando('preencher todos dados para um cadastro {string} e concluir') do |type|
  @screen.cadastro.cadastrar(type)
end

Então('deve visualizar a {string}') do |msg|
  expect(@screen.cadastro.valida_msg(msg)).to be_truthy
end

##
Então('confirmar o popup sendo direcionado para home novamente') do
  @screen.cadastro.btn_ok
  @screen.home.home_page?
  back
end

Quando('clicar no usuario recem cadastrado') do
  @screen.cadastro.excluir_
end

Então('clicar para excluir deve se visualizar a {string}') do |msg|
  @screen.cadastro.exclusao_msg_pop(msg)
end

Então('a mensagem {string}') do |msg_ex|
  expect(@screen.cadastro.confirm_exclusao(msg_ex)).to be_truthy
end
