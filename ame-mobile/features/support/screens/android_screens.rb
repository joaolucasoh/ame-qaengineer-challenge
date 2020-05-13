# frozen_string_literal: true

include CommonsCadastroBasico
include CadastroCompleto

class Home
  attr_reader :home

  def allow
    msg_allow = find_element(xpath: "//android.widget.Button[@text='Allow']")
    msg_allow.click if msg_allow.displayed? == true
  end

  def home_page?
    find_element(xpath: "//*[contains(@text,'Cadastro de Clientes')]")
    btn_start
  end
end

class Cadastro
  attr_reader :Cadastro

  def start_cadastro
    option = 'Cadastrar Novo'
    btn_start.click
    find_element(xpath: "//*[contains(@text,'#{option}')]").click
  end

  def cadastrar(type)
    if type == 'Básico'
      basico.click
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
    completo.click
    orgaoemissor.click
    orgaoemissor.send_keys('SSP')

    mae.click
    mae.send_keys(Faker::Name.female_first_name)

    pai.click
    pai.send_keys(Faker::Name.male_first_name)

    cadastro_basico
    dados_empresa
    btn_salvar
  end

  def dados_pessoais
    name.click
    name.send_keys(Faker::Name.name)
    rg.click
    rg.send_keys(Faker::Number.leading_zero_number(digits: 9))
    cpf.click
    cpf.send_keys(Faker::CPF.numeric)
    data.click
    data.send_keys('13091991')
  end

  def endereco_completo
    endereco.click
    endereco.send_keys(Faker::Address.street_name)
    numero.click
    numero.send_keys(Faker::Address.building_number)
    bairro.click
    bairro.send_keys(Faker::Address.city)
    cep.click
    cep.send_keys(Faker::Number.leading_zero_number(digits: 9))

    cidade.click
    cidade.send_keys(Faker::Address.city)
  end

  def dados_empresa
    empresa.click
    empresa.send_keys(Faker::Restaurant.name)

    cargo.click
    cargo.send_keys(Faker::Job.position)

    endereco_empresa.click
    endereco_empresa.send_keys(Faker::Address.street_name)

    cep_empresa.click
    cep_empresa.send_keys(Faker::Number.leading_zero_number(digits: 9))

    tel_empresa.click
    tel_empresa.send_keys(Faker::PhoneNumber.phone_number)

    data_admissao.click
    data_admissao.send_keys('01012000')

    renda.click
    renda.send_keys(money)

    tel_ref.click
    tel_ref.send_keys(Faker::PhoneNumber.phone_number)

    banco.click
    banco.send_keys(Faker::Bank.name)

    agencia.click
    agencia.send_keys(Faker::Bank.account_number(digits: 4))

    conta.click
    conta.send_keys(Faker::Bank.account_number(digits: 6))
  end

  def money
    "R$ #{::Faker::Number.decimal(l_digits: 2)}"
  end

  def contatos
    telefone1.click
    telefone1.send_keys(Faker::PhoneNumber.phone_number)
    email.click
    email.send_keys(Faker::Internet.email)

    Appium::TouchAction.new.swipe(start_x: 0.90, start_y: 0.5, offset_x: 0.5, offset_y: 0.5, duration:3500).perform
    # execute_script('mobile: swipe', direction: 'up')
    # Appium::TouchAction.new.swipe(start_x: 455, start_y: 1745, end_x: 433, end_y: 866, duration: 500).click

    obs.click
    obs.send_keys(Faker::Lorem.sentences(number: 10))
  end

  def btn_salvar
    salvar.click
  end

  def valida_msg(msg)
    find_element(xpath: "//*[contains(@text,'#{msg}')]").displayed?
  end

  def btn_ok
    find_element(id: 'android:id/button1').click
  end

  def excluir_
    cliente = find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/nomeLista')
    name_c = cliente.text

    cliente.click
    if find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editNome').text == name_c
      btn_excluir.click
    end
  end

  def exclusao_msg_pop(msg)
    get_msg = find_element(id: 'android:id/message').text
    if get_msg == msg
      find_element(id: 'android:id/button1').click
    end
  end

  def confirm_exclusao(msg)
    get_msg = find_element(xpath: '//hierarchy/android.widget.Toast').text
    get_msg == msg
  end
end
