class RenameAvailabilityToRequiredLevel < ActiveRecord::Migration
  def change
    rename_column :products, :availability, :required_level
  end
end
