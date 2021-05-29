class CreateProductoImagens < ActiveRecord::Migration[6.1]
  def change
    create_table :producto_imagens do |t|
      t.string :nombre, :null => false
      t.boolean :principal, :default => false
      t.integer :producto_id, :null => false

      t.timestamps
    end
  end
end
