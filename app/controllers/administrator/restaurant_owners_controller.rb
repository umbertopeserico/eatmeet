class Administrator::RestaurantOwnersController < Administrator::AdministratorController
  before_action :set_restaurant_owner, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @restaurant_owners = RestaurantOwner.all
    respond_with(@restaurant_owners)
  end

  def show
    respond_with(@restaurant_owner, location: administrator_restaurant_owner_path)
  end

  def new
    @restaurant_owner = RestaurantOwner.new
    respond_with(@restaurant_owner)
  end

  def edit
  end

  def create
    @restaurant_owner = RestaurantOwner.new(restaurant_owner_params)
    @restaurant_owner.save
    respond_with(@restaurant_owner, location: administrator_restaurant_owner_path(@restaurant_owner))
  end

  def update
    @restaurant_owner.update(restaurant_owner_params)
    respond_with(@restaurant_owner, location: administrator_restaurant_owner_path(@restaurant_owner))
  end

  def destroy
    @restaurant_owner.destroy
    respond_with(@restaurant_owner, location: administrator_restaurant_owners_path)
  end

  private
    def set_restaurant_owner
      @restaurant_owner = RestaurantOwner.find(params[:id])
    end

    def restaurant_owner_params
      params.require(:restaurant_owner).permit(:name, :surname, :email, :password, :password_confirmation)
    end
end
