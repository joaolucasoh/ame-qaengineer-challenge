# frozen_string_literal: true

module CommonsElements
  def email
    @email ||= find('#email')
  end

  def passwd
    @passwd ||= find('#passwd')
  end

  def btnlogin
    @btnlogin ||= find('#SubmitLogin')
  end

  def emailcreate
    @emailcreate ||= find('#email_create')
  end
end
World(CommonsElements)
