class Transaction < ActiveRecord::Base

  validate :seller_and_buyer_exist, :buyer_meets_required_level,
           :buyer_have_enough_space, :buyer_have_enough_money

  before_validation :get_info_for_validation

  after_create :change_data_after_create

  private

  def get_info_for_validation
    @seller = Player.find(seller_id)
    @buyer  = Player.find(buyer_id)
    @offer  = Offer.find(offer_id)
  end

  def change_data_after_create
    @buyer.reload
    @seller.reload
    @offer.reload

    @buyer.balance  -= @offer.price
    @seller.balance += @offer.price

    begin
      ActiveRecord::Base.transaction do

        storage_product = StorageProduct.find_by(storage_id: @buyer.storage.id, product_id: @offer.product.id)

        if storage_product.blank?
          StorageProduct.create!(
              storage_id: @buyer.storage.id,
              product_id: @offer.product.id,
              quantity: @offer.quantity
          )
        else
          storage_product.quantity += @offer.quantity
          storage_product.save
        end

        @buyer.save
        @seller.save
        @offer.delete
      end
    rescue ActiveRecord::StatementInvalid
      self.delete
    end
  end

  def seller_and_buyer_exist
    if @seller.blank?
      errors.add(:seller_id, 'Seller should exist')
    end

    if @buyer.blank?
      errors.add(:buyer_id, 'Buyer should exits')
    end
  end

  def buyer_meets_required_level
    if @buyer.level < @offer.product.required_level
      errors.add(:buyer_id, "Buyer's level should be greater or equal to required level of product")
    end
  end

  def buyer_have_enough_space
    if @buyer.storage.free_space < @offer.quantity
      errors.add(:buyer_id, 'Buyer do not have enough free space at his storage')
    end
  end

  def buyer_have_enough_money
    if @buyer.balance < @offer.price
      errors.add(:buyer_id, 'Buyer do not have enough money')
    end
  end

end
