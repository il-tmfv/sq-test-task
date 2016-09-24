class Storage < ActiveRecord::Base
  has_many :products, through: :storage_products
  has_many :storage_products
  belongs_to :player
end
