# frozen_string_literal: true

require 'appium_lib'
require 'appium_console'
require 'faker'
require 'cpf_faker'
require 'pry'

username = 'joolucasoliveira2'
access_key = 'mQTbTLLzXdvVLWhgsgg1'

caps = {}
caps['build'] = 'My First MOBILE Build'
caps['name'] = 'Bstack-[Ruby] Sample Test MOBILE'
caps['project'] = 'My First Project'
caps['device'] = 'Google Pixel 3'
caps['os_version'] = '9.0'
caps['autoAcceptAlerts'] = 'true'
caps['autoGrantPermissions'] = 'true'
caps['app'] = 'bs://c5c895f135eba6605ea75b92afea735b971b66c5'

DEVICE = ENV['DEVICE_TYPE']
Appium::Driver.new({
                     'caps' => caps,
                     'appium_lib' => {
                       server_url: "http://#{username}:#{access_key}@hub-cloud.browserstack.com/wd/hub"
                     }
                   }, true)
Appium.promote_appium_methods Object
Selenium::WebDriver::Wait.new(timeout: 30)

