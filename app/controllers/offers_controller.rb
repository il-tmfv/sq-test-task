class OffersController < ApiController
  def index
    @offers = Offer.all
  end

  def show
    if params[:id].blank?
      return render status: 400, json: { error: ApiError::INVALID_ARGUMENTS }
    end

    @offer = Offer.find(params[:id])
  end

  def create
    if params[:player_id].blank? || params[:product_id].blank? || params[:price].blank? || params[:quantity].blank?
      return render status: 400, json: { error: ApiError::INVALID_ARGUMENTS }
    end

    @offer = Offer.new(permitted_params)

    if @offer.valid?
      @offer.save
      render_ok
    else
      render status: 400, json: { error: @offer.errors.messages }
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
