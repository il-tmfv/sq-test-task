class Offer < ActiveRecord::Base
  belongs_to :player
  belongs_to :product

  validate :quantity_cannot_be_zero, :player_should_exist,
           :player_should_have_quota, :product_should_exist,
           :player_should_have_enough_products, :price_should_be_in_50p_range

  after_create :change_data_after_create

  before_validation :get_info_for_validation

  private

  def get_info_for_validation
    @player = Player.find(player_id)
    @product = Product.find(product_id)
  end

  def change_data_after_create
    ActiveRecord::Base.transaction do
      @player.placed_products_quantity += quantity

      storage_product = StorageProduct.where(
          storage_id: @player.storage.id,
          product_id: product_id
      ).first
      storage_product.quantity -= quantity

      @player.save
      storage_product.save
    end
  end

  def quantity_cannot_be_zero
    if quantity <= 0
      errors.add(:quantity, 'Quantity cannot be equal to zero or less then zero')
    end
  end

  def player_should_exist
    if @player.blank?
      errors.add(:player_id, 'Player should exist')
    end
  end

  def player_should_have_quota
    if @player.placed_products_quantity + quantity > ConfigProvider.instance.players_quota
      errors.add(:quantity, 'Player should have free space at the marketplace')
    end
  end

  def product_should_exist
    if @product.blank?
      errors.add(:product_id, 'Product should exist')
    end
  end

  def player_should_have_enough_products
    if StorageProduct.where(
        'storage_id = ? AND product_id = ? AND quantity >= ?',
        @player.storage.id,
        product_id,
        quantity
    ).blank?
      errors.add(:product_id, 'Player should have enough products')
    end
  end

  def price_should_be_in_50p_range
    if price <= 0
      errors.add(:price, 'Price cannot be less that zero or equal to zero')
    end

    configured_price = ConfigProvider.instance.product(@product.title)['price']

    if (price < 0.5 * configured_price) || (price > 1.5 * configured_price)
      errors.add(:price, 'Price should be in +- 50% range')
    end
  end

end
