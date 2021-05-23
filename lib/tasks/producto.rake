namespace :create do
  desc "Crea un catalogo de productos"
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
  end
end
