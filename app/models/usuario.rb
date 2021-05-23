class Usuario < ApplicationRecord
  has_one :token
  has_many :usuario_productos
  has_many :productos, :through =>  :usuario_productos
end
