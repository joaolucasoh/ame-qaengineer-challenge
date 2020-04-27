# frozen_string_literal: true

require_relative 'base_pages'

class Login < SitePrism::Page
  attr_reader :login

  element :email, '#email'
  element :passwd, '#passwd'
  element :btnlogin, '#SubmitLogin'
  element :emailcreate, '#email_create'

  def forgotpasswd_page?
    msg = 'Forgot your password?'
    click_on(msg)
    find('.page-subheading', text: msg)
  end

  def valid_message?(msg)
    within('.alert-danger', visible: true) do
      find('ol li', text: msg)
    end
  end

  def logar(usr, pwd)
    email.set(usr)
    passwd.set(pwd)
    btnlogin.click
  end

  def emailinvalido(usr)
    email.set(usr)
    passwd.set(Faker::Lorem.characters(number: 8))
    btnlogin.click
  end

  def forgotpasswd(usr)
    email.set(usr)
    click_button('Retrieve Password')
  end

  def forgotmsg(msg)
    find('p.alert-success', text: msg) if has_css?('p.alert-success') == true
    valid_message?(msg) if has_css?('.alert-danger') == true
  end

  def myaccount?
    has_title?('My account')
    find("[title='Orders']")
    find("[title='Credit slips']")
    find("[title='Addresses']")
    find("[title='Information']")
    find("[title='My wishlists']")
  end
end
