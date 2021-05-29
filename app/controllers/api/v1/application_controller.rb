class Api::V1::ApplicationController < Api::V1::ExceptionsController
  before_action :check_token, except: [:oauth]
  before_action :check_username_password, only: [:oauth]

  #  Esto mantiene la seguridad de todos los controllers
  # -----------------------------------------------------------------------
  def check_token
    @usuario = ::V1::Credentials.check_token(authorization: request.headers["Authorization"])
  end

  def check_username_password
    @token, @valid_until = ::V1::Credentials.check_username_password(user: params[:user],
                                                                     password: params[:password])
  end
end
