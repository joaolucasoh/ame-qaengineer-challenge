# frozen_string_literal: true

include CommonsCadastroBasico
include CadastroCompleto

class Home
  attr_reader :home

  def home_page?
    find_element(xpath: "//*[contains(@text,'Cadastro de Clientes')]")
    btn_start
  end
end

class Cadastro
  attr_reader :Cadastro

  def start_cadastro
    option = 'Cadastrar Novo'
    action.click(btn_start).perform
    action.click(find_element(xpath: "//*[contains(@text,'#{option}')]")).perform
  end

  def cadastrar(type)
    if type == 'Básico'
      action.click(basico).perform
      cadastro_basico
      btn_salvar
    else
      cadastro_completo
    end
  end

  def cadastro_basico
    dados_pessoais
    endereco_completo
    contatos
  end

  def cadastro_completo
    action.click(completo).perform
    action.click(orgaoemissor).perform
    action.send_keys(orgaoemissor, 'SSP').perform

    action.click(mae).perform
    action.send_keys(mae, Faker::Name.female_first_name).perform

    action.click(pai).perform
    action.send_keys(pai, Faker::Name.male_first_name).perform

    cadastro_basico
    dados_empresa
    btn_salvar
  end

  def dados_pessoais
    action.click(name).perform
    action.send_keys(name, Faker::Name.name).perform
    action.click(rg).perform
    action.send_keys(rg, Faker::Number.leading_zero_number(digits: 9)).perform
    action.click(cpf).perform
    action.send_keys(cpf, Faker::CPF.numeric).perform
    action.click(data).perform
    action.send_keys(data, '13091991').perform
  end

  def endereco_completo
    action.click(endereco).perform
    action.send_keys(endereco, Faker::Address.street_name).perform
    action.click(numero).perform
    action.send_keys(numero, Faker::Address.building_number).perform
    action.click(bairro).perform
    action.send_keys(bairro, Faker::Address.city).perform
    action.click(cep).perform
    action.send_keys(cep, Faker::Number.leading_zero_number(digits: 9)).perform

    action.click(cidade).perform
    action.send_keys(cidade, Faker::Address.city).perform
  end

  def dados_empresa
    action.click(empresa).perform
    action.send_keys(empresa, Faker::Restaurant.name).perform

    action.click(cargo).perform
    action.send_keys(cargo, Faker::Job.position).perform

    action.click(endereco_empresa).perform
    action.send_keys(endereco_empresa, Faker::Address.street_name).perform

    action.click(cep_empresa).perform
    action.send_keys(cep_empresa, Faker::Number.leading_zero_number(digits: 9)).perform

    action.click(tel_empresa).perform
    action.send_keys(tel_empresa, Faker::PhoneNumber.phone_number).perform

    action.click(data_admissao).perform
    action.send_keys(data_admissao, '01012000').perform

    action.click(renda).perform
    action.send_keys(renda, money).perform

    action.click(tel_ref).perform
    action.send_keys(tel_ref, Faker::PhoneNumber.phone_number).perform

    action.click(banco).perform
    action.send_keys(banco, Faker::Bank.name).perform

    action.click(agencia).perform
    action.send_keys(agencia, Faker::Bank.account_number(digits: 4)).perform

    action.click(conta).perform
    action.send_keys(conta, Faker::Bank.account_number(digits: 6)).perform
  end

  def money
    "R$ #{::Faker::Number.decimal(l_digits: 2)}"
  end

  def contatos
    action.click(telefone1).perform
    action.send_keys(telefone1, Faker::PhoneNumber.phone_number).perform
    action.click(email).perform
    action.send_keys(email, Faker::Internet.email).perform

    Appium::TouchAction.new.swipe(start_x: 455, start_y: 1745, end_x: 433, end_y: 866, duration: 500).perform

    action.click(obs).perform
    action.send_keys(obs, Faker::Lorem.sentences(number: 10)).perform
  end

  def btn_salvar
    action.click(salvar).perform
  end

  def valida_msg(msg)
    find_element(xpath: "//*[contains(@text,'#{msg}')]").displayed?
  end

  def btn_ok
    action.click(find_element(id: 'android:id/button1')).perform
  end

  def excluir_
    cliente = find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/nomeLista')
    name_c = cliente.text

    action.click(cliente).perform
    action.click(btn_excluir).perform if find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editNome').text == name_c
  end

  def exclusao_msg_pop(msg)
    get_msg = find_element(id: 'android:id/message').text
    action.click(find_element(id: 'android:id/button1')).perform if get_msg == msg
  end

  def confirm_exclusao(msg)
    get_msg = find_element(xpath: '//hierarchy/android.widget.Toast').text
    get_msg == msg
  end
end
