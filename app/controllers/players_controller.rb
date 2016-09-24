class PlayersController < ApiController
  def show
    if params[:id].blank?
      return render status: 400, json: { error: ApiError::INVALID_ARGUMENTS }
    end

    @player = Player.find_by_id(params[:id])

    if @player.blank?
      return render status: 404, json: { error: ApiError::NOT_FOUND }
    end

    @player
  end
end
