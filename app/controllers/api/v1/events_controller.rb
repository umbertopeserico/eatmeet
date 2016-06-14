class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :participants]
  #before_action :authenticate_user!
  respond_to :json

  def index
    @events = Event.all
    events = @events.map do |event|
      CategorySerializer.new(event)
    end
    respond_with(
      {
        events: events,
        meta: {}
      }
    )
  end

  def show
    respond_with(@event)
  end

  def participants
    @users = @event.users
    render 'users/index'
  end

  def search
    @events = Event.search(search_params)
    events = @events.map do |event|
      EventSerializer.new(event)
    end
    respond_with(
      {
        events: events,
        meta: {}
      },
      location: search_api_events_path
    )
  end

  private
    def get_response
      events = @events.map do |event|
        CategorySerializer.new(event)
      end
      respond_with(
        {
          events: events,
          meta: {}
        }
      )
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def search_params
      params.require(:filters).permit(
          :categories => [],
          :date_range => [:start, :end],
          :price_range => [:start, :end],
          :participants_range => [:start, :end],
          :actual_sale_range => [:start, :end]
      )
    end
end
