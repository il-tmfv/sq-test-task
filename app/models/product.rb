class Product < ActiveRecord::Base
  has_many :storages, through: :storage_products
  has_many :offers
  has_many :storage_products
end
