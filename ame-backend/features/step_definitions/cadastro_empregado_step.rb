# frozen_string_literal: true

Dado('que realize o cadastro de um novo empregado') do
  @body = {
    "name": 'Teste AME Digital',
    "salary": '20000',
    "age": '21'
  }.to_json

  binding.pry
  @post_status = Employee.post('/create', body: @body)
end

Então('devo ter o retorno com o {int}') do |status|
  expect(@post_status.code).to eq status
end
