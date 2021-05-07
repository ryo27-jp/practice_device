class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @review = Review.new(review_params)
    @game = Game.find(params[:game_id])
    @reviews = @game.reviews

    if @review.save
      redirect_to game_path(params[:game_id])
    else
      render template: 'games/show', game: @game, reviews: @reviews
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])

    @review.destroy!
    redirect_to game_path(params[:game_id])
  end

  private

  def review_params
    params.require(:review).permit(:body).merge(game_id: params[:game_id], user_id: current_user.id)
  end
end
