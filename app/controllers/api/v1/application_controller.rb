class Api::V1::ApplicationController < Api::V1::ExceptionsController
  before_action :check_token, except: [:oauth]
  before_action :check_username_password, only: [:oauth]

  def oauth
    render :json => {:token => @token, :valid_until => @valid_until}
  end

  protected

  def check_token
    @usuario = ::V1::Credentials.check_token(authorization: request.headers["Authorization"])

    raise ::Exceptions::UserNotFound if @usuario.nil?
  end

  #  Este chequeo es por si algun pillo quiere usar un token valido de otro
  #  usuario para obtener datos o hacer modificaciones en este usuario
  # -----------------------------------------------------------------------
  def check_usuario
    raise ::Exceptions::UserNotFound if @usuario.id != $usuario_id
  end

  private

  def check_username_password
    @token, @valid_until = ::V1::Credentials.check_username_password(user: params[:user],
                                                                     password: params[:password])
  end
end
