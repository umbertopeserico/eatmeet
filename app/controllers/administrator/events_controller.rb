class Administrator::EventsController < Administrator::AdministratorController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event, location: administrator_event_path)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event, location: administrator_event_path)
  end

  def update
    @event.update(event_params)
    respond_with(@event, location: administrator_event_path)
  end

  def destroy
    @event.destroy
    respond_with(@event, location: administrator_event_path)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :schedule, :menu_id, :max_people, :min_people, :people_min_price, :max_price, :min_price, :actual_price)
    end
end
