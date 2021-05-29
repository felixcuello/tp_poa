class HealthCheckController < ApplicationController
  def pong
    render :json => {"message": "Hola, estoy vivo!"}
  end
end
