namespace :create do
  desc "Borra y Crea un NUEVO catalogo de productos"
  task :sample_catalog => :environment do |t, args|
# => #<Producto id: nil, nombre: nil, puntos: nil, activo: nil, created_at: nil, updated_at: nil>
    @productos = [
      { nombre: 'Tostadora', puntos: 100, activo: true},
      { nombre: 'Medias', puntos: 10, activo: true},
      { nombre: 'Televisor', puntos: 10000, activo: true},
      { nombre: 'Botella Termica', puntos: 100, activo: false},
      { nombre: 'Gorra tipo golf', puntos: 10, activo: false}
    ]

    Producto.delete_all

    puts "--------------------------------------------------"
    puts "  Creando catálogo de productos"
    puts "--------------------------------------------------"
    @productos.each do |p|
      puts "Nombre: '#{p[:nombre]} [valor en puntos: #{p[:puntos]} / Activo?: #{p[:activo]}]'"
      Producto.new(nombre: p[:nombre],
                   puntos: p[:puntos],
                   activo: p[:activo]).save!
    end

    puts "--------------------------------------------------"
    puts "  Agregando Imagenes"
    puts "--------------------------------------------------"
    puts ". Tostadora"
    tostadora = Producto.find_by(nombre: 'Tostadora')
    pi = ProductoImagen.new(nombre: 'tostadora_1.jpg', principal: true)
    tostadora.producto_imagens << pi
    tostadora.save!

    puts ". Medias"
    medias = Producto.find_by(nombre: 'Medias')
    pi = ProductoImagen.new(nombre: 'medias_1.jpg', principal: true)
    medias.producto_imagens << pi
    medias.save!

    puts ". Televisor"
    tv = Producto.find_by(nombre: 'Televisor')
    pi = ProductoImagen.new(nombre: 'televisor_1.jpg', principal: true)
    tv.producto_imagens << pi
    pi = ProductoImagen.new(nombre: 'televisor_2.jpg', principal: false)
    tv.producto_imagens << pi
    tv.save!
  end
end
