class Player < ActiveRecord::Base
  has_many :products, through: :player_products
  has_many :player_products
end
