class Producto < ApplicationRecord
  has_many :usuario_productos
  has_many :usuarios, :through =>  :usuario_productos
end
