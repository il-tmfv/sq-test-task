class Product < ActiveRecord::Base
  has_many :players, through: :player_products
  has_many :player_products
end
