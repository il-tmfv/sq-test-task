class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price
      t.integer :availability

      t.timestamps null: false
    end
  end
end
