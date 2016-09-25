class RenameStorageIdToPlayerId < ActiveRecord::Migration
  def change
    rename_column :storage_products, :storage_id, :player_id
  end
end
