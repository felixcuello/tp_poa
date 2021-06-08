require "test_helper"

class UsuarioTest < ActiveSupport::TestCase
  @@user_name = 'felix_test'
  @@user_pass = 'felix_test'
  @@user_invalid_pass = 'xxxxxxx'

  test 'valid user' do
    usuario = Usuario.find_by(user: @@user_name)
    usuario = Usuario.new(nombre: 'felix', user: @@user_name) if usuario.nil?

    usuario.password = ::V1::Password.sha512(string: @@user_pass)
    usuario.save!

    assert_not_nil(::Credentials.check_username_password(user: @@user_name, password: @@user_pass))
  end


  test 'invalid user' do
    usuario = Usuario.find_by(user: @@user_name)
    usuario = Usuario.new(nombre: 'felix', user: @@user_name) if usuario.nil?

    usuario.password = ::V1::Password.sha512(string: @@user_pass)
    usuario.save!

    begin
      ::Credentials.check_username_password(user: @@user_name, password: @@user_invalid_pass)
      assert(false) # ESTO TIENE que fallar en caso de excepción
    rescue Exceptions::UserNotFound
      assert(true)  # Si lanza excepción está bien
    end
  end
end
