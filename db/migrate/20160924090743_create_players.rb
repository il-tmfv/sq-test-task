class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :level
      t.float :exp
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
