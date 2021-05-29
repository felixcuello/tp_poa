require 'digest'

module Password
  #------------------------------------------------------------------------
  #  Esto genera un hash SHA512 para utilizar con la password del usuario.
  #  De esta manera no guardamos el password en texto plano.
  #
  #  NOTA DE SEGURIDAD:
  #  Técnicamente hay que usar una SALT y guardarla en la base de datos
  #  pero no es necesario para los fines de este proyecto.
  #------------------------------------------------------------------------
  def self.sha512(string:)
    Digest::SHA2.new(512).hexdigest(string)
  end
end
