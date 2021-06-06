require 'jwt'

module V1::Jwt
  def self.decode(usuario:, body:)
    token = usuario.token.token
    JWT.decode(body, token, 'HS256')
  rescue => e
    Rails.logger.error("Error el token no encontrado, excepcion #{e.message}")
    raise ::Exceptions::InvalidSignature
  end
end
