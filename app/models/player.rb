class Player < ActiveRecord::Base
  has_many :offers
  has_one :storage
end
