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
    @restaurant = Restaurant.new(params_resto)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
    @reviews.destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def params_resto
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end


end
