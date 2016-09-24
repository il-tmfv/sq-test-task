class AddPlayerIdToStorage < ActiveRecord::Migration
  def change
    add_column :storages, :player_id, :integer
  end
end
