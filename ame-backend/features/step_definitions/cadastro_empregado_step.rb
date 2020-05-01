# frozen_string_literal: true

Dado('que realize o cadastro de um novo empregado') do
  @body = {
    "name":'Teste AME Digital',
    "salary":'20000',
    "age":'21'
  }.to_json

  @post_status = Employee.post('/create', body: @body)
end

Então('devo ter o retorno com o {string}') do |status|
  puts @poststatus.code
  expect(@poststatus.code).to eq(status)
end
