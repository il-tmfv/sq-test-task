class StorageProduct < ActiveRecord::Base
  belongs_to :storage
  belongs_to :product
end
