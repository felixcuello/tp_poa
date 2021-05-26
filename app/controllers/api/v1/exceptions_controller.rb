class Api::V1::ExceptionsController < ApplicationController
  rescue_from ::Exceptions::UserNotFound, :with => :user_not_found
  rescue_from ::Exceptions::TokenNotFound, :with => :token_not_found

  private

  def user_not_found; render_error(500, "El usuario o la contraseña es incorrecta") end
  def token_not_found; render_error(500, "El token no existe o ha expirado") end

  def render_error(status, message)
    render :json => {"mensaje" => message}, :status => status
  end
end
