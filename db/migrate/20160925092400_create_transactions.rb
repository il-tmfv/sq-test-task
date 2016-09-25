class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :offer_id

      t.timestamps null: false
    end
  end
end
