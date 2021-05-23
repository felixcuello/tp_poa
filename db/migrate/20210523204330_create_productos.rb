class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :puntos
      t.boolean :activo

      t.timestamps
    end
  end
end
