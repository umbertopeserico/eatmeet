class Administrator::MenusController < Administrator::AdministratorController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @menus = Menu.all
    respond_with(@menus, location: administrator_menus_path)
  end

  def show
    respond_with(@menu, location: administrator_menu_path)
  end

  def new
    @menu = Menu.new
    respond_with(@menu)
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    respond_with(@menu, location: administrator_zone_path)
  end

  def update
    @menu.update(menu_params)
    respond_with(@menu, location: administrator_menu_path)
  end

  def destroy
    @menu.destroy
    respond_with(@menu, location: administrator_zone_path)
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:title, :html_menu, :max_price, :min_price, :restaurant_id)
    end
end
