require 'jwt'

module Jwt
  def self.decode(usuario:, body:)
    token = usuario.token.token
    body = JWT.decode(body, token, 'HS256')
    return body
  rescue => e
    Rails.logger.error("Error el token no encontrado, excepcion #{e.message}")
    raise ::Exceptions::TokenNotFound
  end
end
