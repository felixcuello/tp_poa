class Api::V1::ApplicationController < Api::V1::ExceptionsController
  before_action :check_token, except: [:oauth]
  before_action :check_username_password, only: [:oauth]

  def oauth
    render :json => {:token => @token, :valid_until => @valid_until}
  end

  protected

  def check_token
    ::V1::Credentials.check_token(authorization: request.headers["Authorization"])
  end

  private

  def check_username_password
    @token, @valid_until = ::V1::Credentials.check_username_password(user: params[:user],
                                                                     password: params[:password])
  end
end
