class Api::V1::PlayersController < ApiController
  def index
    @players = Player.all
  end

  def show
    if params[:id].blank?
      return render status: 400, json: { error: ApiError::INVALID_ARGUMENTS }
    end

    @player = Player.find(params[:id])
  end

  def buy
    if params[:offer_id].blank? || params[:player_id].blank?
      return render status: 400, json: { error: ApiError::INVALID_ARGUMENTS }
    end

    offer = Offer.find(params[:offer_id])

    @transaction = Transaction.new(
        seller_id: offer.player_id,
        buyer_id: params[:player_id],
        offer_id: params[:offer_id]
    )

    if @transaction.valid?
      @transaction.save
      render_ok
    else
      render status: 400, json: { error: @transaction.errors.messages }
    end
  end
  
  private

  def transaction_permitted_params
    params.require(:transaction).permit(:seller_id, :buyer_id, :offer_id)
  end
  
end
