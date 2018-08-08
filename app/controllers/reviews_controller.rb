class ReviewsController < ApplicationController
  def new
    @review = Review.new
    #send the restaurant object
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  # def create
  #   #i will need a restaurant object to set the id
  #   #you'll get it from the param (the id of the restauant)

  #   @review = Review.new(review_param)
  #   @review.restaurant = Restaurant.find(params[:restaurant_id])
  #   @review.save
  #   redirect_to restaurant_path(params[:restaurant_id])
  # end
    def create
    #1 - Let's populate a new Review object witht the input from the user
    @review = Review.new(review_param)
    #2 - Let's get the Restaurant this review is being created for
    #i will need a restaurant object to set the id of the Review Object
    #you'll get it from the param (the id of the restauant)
    @restaurant = Restaurant.find(params[:restaurant_id])

    #3 - let's now set the @review.restaurant_id to the @restaurant.id
    @review.restaurant = @restaurant
    #let's save!
    if @review.save
    redirect_to restaurant_path(params[:restaurant_id])
    else
      render :new
    end
  end

    private

    def review_param
      params.require(:review).permit(:content, :rating)
    end
  end
