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

  def search
    response = Game.search(search_params[:q], {})
    puts "My results #{response.results.total}"

    games = response.map do |r|
      r.merge(r.delete('_source')).merge('id': r.delete('_id'))
    end

    render json: { games: games }, status: :ok
  end

  private

  def game_params
    params
      .require(:game)
      .permit(:id,
              :name,
              :developer,
              :genre,
              :platform,
              :box_image,
              :story_only,
              :story_plus,
              :full_completion,
              :metacritic_score,
              :steam_app_id,
              :playstation_id,
              :nintendo_id,
              :xbox_id)
  end

  def search_params
    params.permit(:q)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
