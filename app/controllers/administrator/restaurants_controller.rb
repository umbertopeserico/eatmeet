class Administrator::RestaurantsController < Administrator::AdministratorController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def show
    respond_with(@restaurant, location: administrator_restaurant_path)
  end

  def new
    @restaurant = Restaurant.new
    respond_with(@restaurant)
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    respond_with(@restaurant, location: administrator_restaurant_path(@restaurant))
  end

  def update
    @restaurant.update(restaurant_params)
    respond_with(@restaurant, location: administrator_restaurant_path(@restaurant))
  end

  def destroy
    @restaurant.destroy
    respond_with(@restaurant, location: administrator_restaurants_path)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :email, :phone, :street, :city, :zip_code, :province, :restaurant_owner_id)
    end
end
