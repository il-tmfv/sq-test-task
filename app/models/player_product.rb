class PlayerProduct < ActiveRecord::Base
  belongs_to :player
  belongs_to :product
end
