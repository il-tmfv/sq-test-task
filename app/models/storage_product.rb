class StorageProduct < ActiveRecord::Base
  belongs_to :storage
  belongs_to :product

  validates :storage_id, uniqueness: { scope: :product_id,
                                 message: 'Each player should have only one storage record per product'}
end
