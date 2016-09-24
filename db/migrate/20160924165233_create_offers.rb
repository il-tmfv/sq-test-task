class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :player_id
      t.integer :product_id
      t.decimal :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
