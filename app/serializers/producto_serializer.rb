class ProductoSerializer < ActiveModel::Serializer
  attributes :id,
             :nombre,
             :puntos,
             :activo,
             :cantidad,
             :producto_imagens

  def cantidad
    object.activo ? (rand(50) + 1) : 0
  end

  def producto_imagens
    result = []

    object.producto_imagens.each do |imagen|
      result << {
        :id => imagen.id,
        :principal => imagen.principal,
        :path => "#{$request.base_url}/imagenes/productos/#{imagen.nombre}"
      }
    end

    result
  end
end
