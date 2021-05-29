class UsuarioSerializer < ActiveModel::Serializer
  attributes :nombre,
             :user,
             :saldo_puntos,
             :created_at
end
