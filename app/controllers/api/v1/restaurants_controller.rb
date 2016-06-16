class Api::V1::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
    get_response
  end

  # GET /restaurants/1
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  private
  def get_response
    restaurants = @restaurants.map do |restaurant|
      RestaurantSerializer.new(restaurant)
    end
    respond_with(
        {
            restaurants: restaurants,
            meta: {}
        },
        location: api_restaurants_path
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :email, :phone, :street, :city, :zip_code, :province, :restaurant_owner_id, :lat, :lgt)
  end
end
