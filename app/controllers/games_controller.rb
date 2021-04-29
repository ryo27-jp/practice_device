class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path, notice: "#{@game.title}を作成しました。"
    else
      flash.noe[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def edit
  end

  private

  def game_params
    params.require(:game).permit(:title, :text)
  end
end
