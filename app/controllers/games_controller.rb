class GamesController < ApplicationController
  def index
    @q = Game.ransack(params[:q])
    @games = @q.result.page(params[:page]).per(5)
  end

  def show
    @game = Game.find(params[:id])

    @reviews = @game.reviews
    @review = Review.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path, notice: "#{@game.title}を作成しました。"
    else
      flash.now[:danger] = '作成に失敗しました。'
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to games_path, notice: "#{@game.title}を編集しました。"
    else
      flash.now[:danger] = '編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy!
    redirect_to games_path, notice: "#{@game.title}を削除しました。"
  end

  private

  def game_params
    params.require(:game).permit(:title, :text, :image_url)
  end
end
