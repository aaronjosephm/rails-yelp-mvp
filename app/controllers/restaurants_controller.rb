class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new

    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :stars, :phone_number, :category)
  end
end
