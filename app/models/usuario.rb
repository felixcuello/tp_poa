class Usuario < ApplicationRecord
  has_one :token
  has_many :usuario_productos
  has_many :productos, :through =>  :usuario_productos
  before_save :check_saldo

  private

  def check_saldo
    raise ::Exceptions::SaldoInsuficiente if self.saldo_puntos < 0
  end
end
