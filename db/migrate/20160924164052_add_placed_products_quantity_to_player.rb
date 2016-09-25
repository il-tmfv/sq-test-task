class AddPlacedProductsQuantityToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :placed_products_quantity, :integer
  end
end
