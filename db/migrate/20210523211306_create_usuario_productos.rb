class CreateUsuarioProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :usuario_productos do |t|
      t.integer :usuario_id, null: false
      t.integer :producto_id, null: false
      t.integer :puntos_usados, null: false

      t.timestamps
    end
  end
end
