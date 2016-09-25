class PlayersController < ApiController
  def index
    @players = Player.all
  end

  def show
    if params[:id].blank?
      return render status: 400, json: { error: ApiError::INVALID_ARGUMENTS }
    end

    @player = Player.find(params[:id])
  end
end
