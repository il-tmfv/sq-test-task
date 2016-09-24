class OffersController < ApiController
  def index
    @offers = Offer.all
  end

  def show

  end

  def create
    @offer = Offer.new(permitted_params)
    if @offer.save
      render_ok
    else
      render status: 400, json: { error: ApiError::INVALID }
    end
  end

  def destroy
  end

  def update
  end

  private

  def permitted_params
    params.require(:offer).permit(:player_id, :product_id, :price, :quantity)
  end
end
