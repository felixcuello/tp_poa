require 'securerandom'

module V1::Credentials
  #  Chequea que el usuario y contraseña exista, sino tira una excepcion
  #  Además genera el token
  # -----------------------------------------------------------------------
  def self.check_username_password(user:, password:)
    u = Usuario.find_by({:user => user,
                         :password => Password.sha512(string: password)})

    raise ::Exceptions::UserNotFound if u.nil?

    return generate_token(usuario: u)
  end

  #  Chequea y devuelve el token, caso contrario tira una excepción
  # -----------------------------------------------------------------------
  def self.check_token(authorization:)
    token = authorization.gsub(/bearer\s+(.+)/i, '\1')
    token = Token.where("token = ? AND ttl >= ?", token, Time.now).first

    if token.nil?
      sleep 1 # Very simple throttling mechanism
      raise ::Exceptions::TokenNotFound
    end

    token
  end

  private

  #  Genera un token para un usuario
  #
  #  Por razones de seguridad si el usuario se vuelve a autenticar
  #  se invalida cualquier otro token que el usuario haya tenido
  #  anteriormente y se reemplaza por uno nuevo.
  # -----------------------------------------------------------------------
  def self.generate_token(usuario:)
    usuario.token.delete if usuario.token.present? # invalida el token anterior

    token = SecureRandom.hex
    ttl = Time.now + 7.days

    usuario.token = Token.new(token: token, ttl: ttl)
    usuario.save!

    [token, ttl]
  end
end
