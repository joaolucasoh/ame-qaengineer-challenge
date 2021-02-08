# frozen_string_literal: true

require_relative 'android_screens'

class DroidScreens
  attr_accessor :home, :cadastro

  def initialize
    @home = Home::Android.new
    @cadastro = Cadastro.new
  end
end
