class MatchsController < ApplicationController

  def index
    @matchs = Match.limit(10).order("score desc")
    respond_to do |format|
      format.html
      format.json {render :json => @matchs.to_json}
    end
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      render json: @match, status: :created
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  private
  def match_params
    params.require(:match).permit(:player, :score)
  end
end
