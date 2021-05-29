class Api::V1::UsuariosController < Api::V1::ApplicationController
  def index
    render :json => Usuario.all
  end

  def oauth
    render :json => {:token => @token, :valid_until => @valid_until}
  end

  def show
    render :json => @usuario
  end

  def balance
    render :json => {
             :id => @usuario.id,
             :balance => @usuario.saldo_puntos
           }
  end

  def burn_points
    body = ::Jwt.decode(usuario: @usuario, body: request.body.read).first
    balance = ::Burn.points(usuario: @usuario,
                            productos: body["productos"])
    render :json => {
             id: @usuario.id,
             balance: balance
           }
  end
end
