class Api::GamesController < ApplicationController
  #before_action :authenticate_user!

  def index
    @games = Game.all

    if @games
      render json: { message: "Success", data: @games }, status: :ok
    else
      render json: { message: "Error while trying to load games data" }, status: :bad_request
    end
  end

  def show
    if @game
      render json: { message: "Success", data: @game }, status: :ok
    else
      render json: { message: "Invalid game ID." }, status: :bad_request
    end
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      render json: { message: "Game created", data: @game }, status: :ok
    else
      render json: { message: @game.errors }, status: :bad_request
    end
  end
end

private

def game_params
  params
    .require(:game)
    .permit(:id, 
            :name, 
            :developer, 
            :platform, 
            :box_image,
            :story_only,
            :story_plus,
            :full_ccompletion,
            :metacritic_score,
            :steam_app_id,
            :playstion_id,
            :nintendo_id,
            :xbox_id)
end

def set_game
  @game = Game.find(params[:id])
end
