# frozen_string_literal: true

module CommonsCadastroBasico
  def btn_start
    @btn_start ||= find_element(xpath: '//android.widget.ImageButton')
  end

  def basico
    @basico ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/rdBasico')
  end

  def completo
    @completo ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/rdCompleto')
  end

  def name
    @name ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editNome')
  end

  def rg
    @rg ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editRg')
  end

  def cpf
    @cpf ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editCpf')
  end

  def data
    @data ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editData')
  end

  def endereco
    @endereco ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editEndereco')
  end

  def numero
    @numero ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editNumero')
  end

  def bairro
    @bairro ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editBairro')
  end

  def cep
    @cep ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editCep')
  end

  def cidade
    @cidade ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editCidade')
  end

  def telefone1
    @telefone1 ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editTelefone1')
  end

  def email
    @email ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editEmail')
  end

  def obs
    @obs ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/editObs')
  end

  def salvar
    @salvar ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/btnSalvar')
  end

  def btn_excluir
    @btn_excluir ||= find_element(id: 'br.com.dudstecnologia.cadastrodeclientes:id/btnExcluir')
  end
end
World(CommonsCadastroBasico)
