# frozen_string_literal: true

##### login_nok #####
Quando('logar com o {string} e a {string}') do |usr, pwd|
  @amedigital.login.logar(usr, pwd)
end

Então('retornara a seguinte {string}') do |msg|
  @amedigital.login.valid_message?(msg)
end

##### emailinvalido #####
Quando('inserir o {string}') do |usr|
  @amedigital.login.emailinvalido(usr)
end

##### esqueci a senha #####
Quando('clicar em Esqueci a senha') do
  @amedigital.login.forgotpasswd_page?
end

Quando('inserir o {string} cadastrado ou não') do |usr|
  @amedigital.login.forgotpasswd(usr)
end

Então('retornara a seguinte {string} de recuperação') do |msg|
  @amedigital.login.forgotmsg(msg)
end

##### login_ok #####
Então('deve logar e ir para a pagina da minha conta') do
  @amedigital.login.myaccount?
end
