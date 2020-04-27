# frozen_string_literal: true

require_relative 'login_page'
require_relative 'cadastro_page'

class AmeDigitalPages
  attr_accessor :login, :cadastro

  def initialize
    @login = Login.new
    @cadastro = Cadastro.new
  end
end
