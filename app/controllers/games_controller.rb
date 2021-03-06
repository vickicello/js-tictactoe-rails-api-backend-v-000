class GamesController < ApplicationController
  before_action :find_game, only:  [:show, :update]

  def index
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    render json: @game
  end

  def show
    render json: @game
  end

  def update
    @game.update(game_params)
    render json: @game
  end
  
  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.permit(state: [])
  end
end
