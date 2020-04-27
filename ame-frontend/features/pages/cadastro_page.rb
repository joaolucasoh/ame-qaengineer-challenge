# frozen_string_literal: true

require_relative 'base_pages'

class Cadastro < SitePrism::Page
  include CommonsElements
  attr_reader :cadastro

  element :createaccountbtn, '#SubmitCreate'
  element :firstname, '#customer_firstname'
  element :lastname, '#customer_lastname'
  element :addressfirstname, '#firstname'
  element :addresslastname, '#lastname'
  element :company, '#company'
  element :address1, '#address1'

  def cadastrar
    @emailok = emailcreate.set(Faker::Internet.email)
    createaccountbtn.click
    find('.page-heading', text: 'Create an account')
    personal_info
    address
    click_on('Register')
  end

  def personal_info
    choose('Mr.', allow_label_click: true)
    firstname.set(Faker::Name.first_name)
    lastname.set(Faker::Name.last_name)
    passwd.set(Faker::Lorem.characters(number: 8))
    date_birth
    check_news
  end

  def address
    company.set(Faker::Lorem.characters(number: 5))
    address1.set(Faker::Lorem.characters(number: 5))
    region
    find('#other').set('teste 123')
    find('#phone').set('541754-3010')
    find('#phone_mobile').set('5511988034411')
    find('#alias').set('Home Sweet Home')
  end

  def check_news
    find('#newsletter').set(true)
    find('#optin').set(true)
  end

  def region
    find('#city').set(Faker::Lorem.characters(number: 8))
    find('#id_state').find(:option, 'Louisiana').select_option
    find('#postcode').set('70422')
    find('#id_country').find(:option, 'United States').select_option
  end

  def date_birth
    find('#days').find(:option, '13').select_option
    find('#months').find(:option, 'September').select_option
    find('#years').find(:option, '1991').select_option
  end
end
