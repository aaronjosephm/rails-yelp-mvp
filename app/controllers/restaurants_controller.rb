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
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  def destroy

    Restaurant.destroy(params[:id])
    redirect_to restaurants_path
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :stars, :phone_number, :category)
  end
end
