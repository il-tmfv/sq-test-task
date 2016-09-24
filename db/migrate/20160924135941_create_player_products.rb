class CreatePlayerProducts < ActiveRecord::Migration
  def change
    create_table :player_products do |t|
      t.integer :player_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
