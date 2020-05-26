# frozen_string_literal: true

require 'report_builder'

Before do |_scenario|
  visit('/')
  @amedigital = AmeDigitalPages.new
end

Before('@authpage?') do
  has_css?('#slider_row')
  click_on('Sign in')
  find('.page-heading')
  find('#create-account_form') && find('#login_form')
end

After do |scenario|
  screenshot = page.save_screenshot("log/screenshots/#{scenario.__id__}.png")
  embed(screenshot, 'image/png', 'Screenshot')
end

After do
  Capybara.execute_script 'localStorage.clear()'
end

# After do
#   temp_shot = page.save_screenshot('log/image.png')
#   screenshot = Base64.encode64(File.open(temp_shot).read)
#   embed(screenshot, 'image/png', 'Screenshot')
# end

# at_exit do
#   @infos = {
#     'Cliente' => 'AME Digital'.upcase,
#     'Data do Teste' => Time.now.to_s
#   }

#   ReportBuilder.configure do |config|
#     config.input_path = 'log/report.json'
#     config.report_path = 'log/report'
#     config.report_types = [:html]
#     config.report_title = 'QA Engineer Challenge!'
#     config.additional_info = @infos
#     config.color = 'pink'
#   end
#   ReportBuilder.build_report
# end

# After do |scenario|
#   if scenario.failed?
#     screenshot 'image.png'
#     embed('image.png', 'image/png')
#   end
# end
