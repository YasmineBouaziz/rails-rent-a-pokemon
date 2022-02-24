class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(pokemon: @pokemon)
  end

  def new
    @pokemon = Pokemon.find(params[:pokemon])
  end
end
