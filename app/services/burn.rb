module Burn
  #  Canjea un conjunto de productos con un usuario particular
  # -----------------------------------------------------------------------
  def self.points(usuario:, productos:)
    total_puntos = 0
    productos.each do |p|
      producto = Producto.find(p["id"])

      raise ::Exceptions::ProductoNotFound if producto.nil?

      cantidad = p["cantidad"].to_i rescue 0

      total_puntos += producto.puntos * cantidad
      cantidad.times do
        usuario.usuario_productos <<  UsuarioProducto.new(usuario_id: usuario.id,
                                                          producto_id: producto.id,
                                                          puntos_usados: producto.puntos)
      end
    end
    usuario.saldo_puntos -= total_puntos
    usuario.save!

    usuario.saldo_puntos
  end
end
