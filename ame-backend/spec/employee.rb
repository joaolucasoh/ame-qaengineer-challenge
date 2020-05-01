# frozen_string_literal: true

describe 'Cadastrar novo empregado' do
  it 'novo empregado' do
    @nome = 'João Lucas Oliveira Hilario'
    @salary = '25000'
    @age = '29'

    @body = {
      "name": @nome,
      "salary": @salary,
      "age": @age
    }.to_json
    @code_return = Employee.post('/create', body: @body)
    @return = @code_return.parsed_response
    @id = @return['data']['id']

    puts @return
    puts @id

    expect(@code_return.code).to eq 200

    @return_employee = Employee.get("/employee/'#{@id}'")
    @return_employee.parsed_response

    puts @return_employee
    expect(@return_employee['data']['employee_name']).to eq @name
    expect(@return_employee['data']['employee_salary']).to eq @salary
    expect(@return_employee['data']['employee_age']).to eq @age

    @del_result = Employee.delete("/delete/#{@id}")
    expect(@del_result.code).to eq 200
    @return_del = Employee.get("/employee/'#{@id}'")
    expect(@return_del.code).to eq '401'
  end
end
