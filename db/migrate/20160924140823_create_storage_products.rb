class CreateStorageProducts < ActiveRecord::Migration
  def change
    create_table :storage_products do |t|
      t.integer :storage_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
