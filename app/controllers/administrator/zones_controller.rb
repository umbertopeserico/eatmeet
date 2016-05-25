class Administrator::ZonesController < Administrator::AdministratorController
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @zones = Zone.all
    respond_with(@zones)
  end

  def show
    respond_with(@zone, location: administrator_zone_path)
  end

  def new
    @zone = Zone.new
    respond_with(@zone)
  end

  def edit
  end

  def create
    @zone = Zone.new(zone_params)
    @zone.save
    respond_with(@zone, location: administrator_zone_path)
  end

  def update
    @zone.update(zone_params)
    respond_with(@zone, location: administrator_zone_path)
  end

  def destroy
    @zone.destroy
    respond_with(@zone, location: administrator_zone_path)
  end

  private
    def set_zone
      @zone = Zone.find(params[:id])
    end

    def zone_params
      params.require(:zone).permit(:name)
    end
end
