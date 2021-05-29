class Producto < ApplicationRecord
  has_many :usuario_productos
  has_many :usuarios, :through =>  :usuario_productos
  has_many :producto_imagens

  scope :activo, -> { where(activo: true) }
end
