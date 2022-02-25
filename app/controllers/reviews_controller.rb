class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(pokemon_id: @pokemon)
  end


  def create
    @review = Review.new(review_params)
    @review.pokemon = Pokemon.find(params[:pokemon_id])
    if @review.save
      redirect_to pokemon_path(@review.pokemon)
    else
      render 'pokemon/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
