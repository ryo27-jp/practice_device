class RankingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  def index
    @rankings = Ranking.all
  end

  def show
  end

  def new
    @ranking = Ranking.new
  end

  def create
    @ranking = current_user.rankings.new(ranking_params)

    if @ranking.save
      redirect_to rankings_path, notice: "ランキングを作成しました"
    else
      flash.now[:notice] = "作成に失敗しました"
      render :new 
    end
  end


  def edit
    @ranking = current_user.rankings.find(params[:id])
  end

  def update
    @ranking = current_user.rankings.find(params[:id])

    if @ranking.update(ranking_params)
      redirect_to rankings_path, notice: "編集しました"
    else
      flash.now[:notice] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @ranking = current_user.rankings.find(params[:id])

    @ranking.destroy!
    redirect_to rankings_path, notice:"削除しました"
  end

  private

  def ranking_params
    params.require(:ranking).permit(:title, :first_place_id, :second_place_id)
  end
end
