class UsuarioSerializer < ActiveModel::Serializer
  attributes :id,
             :nombre,
             :user,
             :saldo_puntos,
             :created_at
end
