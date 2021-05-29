class Api::V1::ProductosController < Api::V1::ApplicationController
  before_action :set_request

  #  Mostrar todos los productos
  # ------------------------------------------------------------------------
  def index
    render :json => Producto.all
  end

  #  Mostrar solo los productos activos (usando un scope)
  # ------------------------------------------------------------------------
  def activos
    render :json => Producto.activo.all
  end

  #  Mostrar un producto solo
  # ------------------------------------------------------------------------
  def show
    render :json => Producto.find(params[:id])
  end

  private

  #  Esto es para poder usarlo luego en el serializer
  # ------------------------------------------------------------------------
  def set_request
    $request = request
  end
end
