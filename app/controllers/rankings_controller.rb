class RankingsController < ApplicationController
  def index
    @rankings = Ranking.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
