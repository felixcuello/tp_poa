class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre, :null => false
      t.string :user, :null => false
      t.string :password, :null => false
      t.integer :saldo_puntos, default: 0

      t.timestamps
    end
  end
end
