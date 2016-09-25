class Storage < ActiveRecord::Base
  has_many :products, through: :storage_products
  has_many :storage_products
  belongs_to :player

  def occupied
    StorageProduct.group(:storage_id).having(storage_id: id).sum(:quantity)[id]
  end

  def free_space
    ConfigProvider.instance.capacity - occupied
  end
end
