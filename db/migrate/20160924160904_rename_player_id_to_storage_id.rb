class RenamePlayerIdToStorageId < ActiveRecord::Migration
  def change
    rename_column :storage_products, :player_id, :storage_id
  end
end
