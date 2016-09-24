class CreatePlayersProducts < ActiveRecord::Migration
  def change
    create_table :players_products do |t|
      t.integer :player_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
