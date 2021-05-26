class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.string :token
      t.datetime :ttl
      t.integer :usuario_id

      t.timestamps
    end
  end
end
