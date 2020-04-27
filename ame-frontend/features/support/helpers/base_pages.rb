# frozen_string_literal: true

require_relative '../../pages/login_page.rb'

class AmeDigitalPages
  attr_accessor :login

  def initialize
    @login = Login.new
  end
end
