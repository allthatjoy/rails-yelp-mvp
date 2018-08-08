class ReviewsController < ApplicationController
  def new
    @review = Review.new
    #send the restaurant object
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  def create
    #i will need a restaurant object to set the id
    #you'll get it from the param (the id of the restauant)

    @review = Review.new(review_param)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
    redirect_to restaurant_path(params[:restaurant_id])
    else
      render :new
      # if @review.save
      #   # redirect_to restaurant_path(params[:restaurant_id])
      # else
      #   render :new
      # end
    end
  end

    private

    def review_param
      params.require(:review).permit(:content, :rating)
    end
  end
