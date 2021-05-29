namespace :create do
  desc "Crea o actualiza la password/puntos para los usuarios de prueba"
  task :sample_users => :environment do |t, args|
    puts "---------------------------------------------------"
    puts "  Reseteando usuarios"
    puts "---------------------------------------------------"

    puts "- Elimino todos los tokens"
    Token.delete_all

    puts "- Elimino todos los canjes"
    UsuarioProducto.delete_all

    puts "- Reseteando los saldos"
    usuario_rico = Usuario.find_by(user: 'usuario_rico')
    usuario_pobre = Usuario.find_by(user: 'usuario_pobre')
    password = Password.sha512(string: 'password')

    if usuario_rico.nil?
      usuario_rico = Usuario.new(nombre: 'Usuario de Prueba Rico',
                                 user: 'usuario_rico')
    end

    if usuario_pobre.nil?
      usuario_pobre = Usuario.new(nombre: 'Usuario de Prueba Pobre',
                                  user: 'usuario_pobre')
    end

    usuario_rico.saldo_puntos = 30000
    usuario_rico.password = password
    usuario_rico.save!

    usuario_pobre.saldo_puntos = 10
    usuario_pobre.password = password
    usuario_pobre.save!

    puts ""
    puts "Los usuarios 'usuario_rico' y 'usuario_pobre' fueron actualizados!"
  end
end
