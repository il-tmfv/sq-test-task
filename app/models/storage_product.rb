class StorageProduct < ActiveRecord::Base
  belongs_to :storage
  belongs_to :product

  validates :storage_id, uniqueness: { scope: :product_id,
                                 message: 'Each player should have only one storage record per product'}

  validate :player_should_not_be_greedy

  # before_validation :get_info_for_validation

  private

  # def get_info_for_validation
  #   @player = Player.find(player_id)
  #   @product = Product.find(product_id)
  # end

  def player_should_not_be_greedy
    if storage.free_space < quantity
      errors.add(:quantity, 'Player cannot overfill his storage')
    end
  end

end
