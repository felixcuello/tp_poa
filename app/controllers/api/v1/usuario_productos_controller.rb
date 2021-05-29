class Api::V1::UsuarioProductosController < Api::V1::ApplicationController
  before_action :check_usuario, except: [:index]
  before_action :set_productos_canjeados, only: [:show]

  def show
    render :json => {
             usuario: {
               id: @usuario.id,
               nombre: @usuario.nombre
             },
             productos_canjeados: @canjeados
           }
  end

  private

  def set_productos_canjeados
    @canjeados = UsuarioProducto.joins(:producto).
                   select("productos.id AS producto_id, " +
                          "usuario_productos.puntos_usados AS puntos_usados, " +
                          "productos.nombre AS nombre" +
                          "usuario_productos.created_at AS created_at")

    @canjeados = @canjeados.pluck(:producto_id,
                                  :puntos_usados,
                                  :nombre,
                                  :created_at)

    @canjeados.map! do |e|
      producto_id, puntos_usados, nombre, created_at = e

      {
        producto_id: producto_id,
        puntos_usados: puntos_usados,
        nombre: nombre,
        fecha_canje: created_at
      }
    end
  end
end
