class UsuarioProducto < ApplicationRecord
  belongs_to :usuario
  belongs_to :producto
end
