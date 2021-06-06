# ExceptionsController
#
# Es la clase encargada de capturar y mostrar las excepciones al usuario
#
class Api::V1::ExceptionsController < ApplicationController
  rescue_from ::Exceptions::UserNotFound, with: :user_not_found
  rescue_from ::Exceptions::TokenNotFound, with: :token_not_found
  rescue_from ::Exceptions::SaldoInsuficiente, with: :saldo_insuficiente
  rescue_from ::Exceptions::ProductoNotFound, with: :producto_no_encontrado
  rescue_from ::Exceptions::InvalidSignature, with: :firma_invalida
  rescue_from ActiveRecord::RecordNotFound, with: :producto_inexistente

  private

  def user_not_found; render_error(500, 'El usuario o la contraseña es incorrecta') end
  def token_not_found; render_error(500, 'El token no existe o ha expirado') end
  def saldo_insuficiente; render_error(500, 'No tiene suficiente saldo como para canjear ese producto') end
  def producto_no_encontrado; render_error(404, 'No se encuentra el producto solicitado en el catalogo') end
  def firma_invalida; render_error(500, 'La firma no pudo ser verificada') end
  def producto_inexistente; render_error(404, 'El producto seleccionado no existe') end

  def render_error(status, message)
    render json: { mensaje: message }, status: status
  end
end
