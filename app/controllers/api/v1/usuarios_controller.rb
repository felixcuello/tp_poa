class Api::V1::UsuariosController < Api::V1::ApplicationController
  before_action :set_usuario, only: [:balance]
  before_action :check_usuario, except: [:index]

  def index
    render :json => Usuario.all
  end

  def balance
    render :json => {
             :id => @usuario.id,
             :balance => @usuario.saldo_puntos
           }
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
    raise ::Exceptions::UserNotFound if @usuario.nil?
  end

  #  Este chequeo es por si algun pillo quiere usar un token valido de otro
  #  usuario para obtener datos o hacer modificaciones en este usuario
  # -----------------------------------------------------------------------
  def check_usuario
    raise ::Exceptions::UserNotFound if @usuario.id != $usuario_id
  end
end
