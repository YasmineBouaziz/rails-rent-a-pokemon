class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(pokemon_id: @pokemon)
  end

  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.pokemon = Pokemon.find(params[:pokemon_id])
    if @review.save!
      redirect_to pokemon_path(@review.pokemon)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
