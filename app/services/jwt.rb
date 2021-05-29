require 'jwt'

module Jwt
  def self.decode(usuario:, body:)
    token = usuario.token.token
    body = JWT.decode(body, token, 'HS256')
    return body
  end
end
