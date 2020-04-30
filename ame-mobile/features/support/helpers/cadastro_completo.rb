# frozen_string_literal: true

module CadastroCompleto
  def orgaoemissor
    @orgaoemissor ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editOrgao')
  end

  def mae
    @mae ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editMae')
  end

  def pai
    @pai ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editPai')
  end

  def naturalidade
    @naturalidade ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editNaturalidade')
  end

  def empresa
    @empresa ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editEmpresa')
  end

  def cargo
    @cargo ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editCargo')
  end

  def endereco_empresa
    @endereco_empresa ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editEnderecoEmpresa')
  end

  def cep_empresa
    @cep_empresa ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editCepEmpresa')
  end

  def tel_empresa
    @tel_empresa ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editTelefoneEmpresa')
  end

  def data_admissao
    @data_admissao ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editDataAdmissao')
  end

  def renda
    @renda ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editRenda')
  end

  def tel_ref
    @tel_ref ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editTelefoneRef1')
  end

  def banco
    @banco ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editBanco')
  end

  def agencia
    @agencia ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editAgencia')
  end

  def conta
    @conta ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editConta')
  end
end
World(CadastroCompleto)
