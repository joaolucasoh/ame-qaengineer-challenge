# frozen_string_literal: true

require 'capybara/cucumber'
require 'capybara'
require 'faker'
require 'pry'
require 'report_builder'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |config|
  case ENV['BROWSER']
  when 'firefox'
    @driver = :selenium
  when 'chrome'
    @driver = :selenium_chrome
  when 'headless'
    Capybara.register_driver :selenium_chrome_headless do |app|
      chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
        options.add_argument '--window-size=1440,900'
        options.add_argument '--headless'
        options.add_argument '--disable-gpu'
        options.add_argument '--no-sandbox'
        options.add_argument '--disable-site-isolation-trials'
      end
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
      @driver = :selenium_chrome_headless
    end
  else
    puts 'Invalid browser'
  end

  config.default_driver = @driver
  config.app_host = 'http://automationpractice.com/index.php'
  config.ignore_hidden_elements = false
  config.default_max_wait_time = 15
  Capybara.page.driver.browser.manage.window.maximize
end

# @env = ENV['BROWSER']

# Capybara.configure do |config|
#   config.default_driver = :selenium_chrome
#   config.app_host = 'http://automationpractice.com/index.php'
#   config.ignore_hidden_elements = false

#   if @env.eql?('headless')
#     config.default_driver = :selenium_chrome_headless
#   elsif @env.eql?('chrome')
#     config.default_driver = :selenium_chrome
#   elsif @env.eql?('firefox')
#     config.default_driver = :selenium
#   end

#   Capybara.default_max_wait_time = 15
#   Capybara.page.driver.browser.manage.window.maximize
# end

# Capybara.register_driver :selenium_chrome_headless do |app|
#   args = %w[headless disable-gpu window-size=1440,900 no-sandbox]

#   caps = Selenium::WebDriver::Remote::Capabilities.chrome(
#     'chromeOptions' => {
#       'args' => args
#     }
#   )

#   Capybara::Selenium::Driver.load_selenium
#   browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
#     opts.args << '--headless'
#     opts.args << '--disable-gpu' if Gem.win_platform?
#     opts.args << '--no-sandbox'
#     opts.args << '--disable-site-isolation-trials'
#   end

#   Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps, options: browser_options)
# end
