class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
