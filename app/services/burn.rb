module Burn
  def self.points(usuario:, producto_id:)
    producto = Producto.find(producto_id)
    usuario.saldo_puntos -= producto.puntos
    usuario.usuario_productos <<  UsuarioProducto.new(usuario_id: usuario.id,
                                                      producto_id: producto.id,
                                                      puntos_usados: producto.puntos)
    usuario.save!

    usuario.saldo_puntos
  end
end
