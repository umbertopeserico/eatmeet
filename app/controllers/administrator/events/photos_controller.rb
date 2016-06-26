class Administrator::Events::PhotosController < Administrator::AdministratorController
  before_action :set_event
  before_action :set_photo, only: [:destroy]

  respond_to :html

  def new
    @photo = @event.photos.new
    respond_with(@photo)
  end

  def create
    @photo = @event.photos.new(photo_params)
    @photo.save
    respond_with(@event, location: administrator_event_path(@event))
  end

  def destroy
    @photo.destroy
    respond_with(@event, location: administrator_event_path(@event))
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_photo
      @photo = @event.photos.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:image)
    end
end
