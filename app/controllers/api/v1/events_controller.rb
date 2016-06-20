class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :participants]
  #before_action :authenticate_user!
  respond_to :json

  def index
    @events = Event.all
    get_response
  end

  def show
    respond_with(@event)
  end

  def participants
    @users = @event.users
    render 'users/index'
  end

  def search
    if params[:order].nil?
      if params[:filters].nil?
        @events = Event.search(search_params)
      else
        @events = Event.search
      end
    else
      if params[:filters].nil?
        @events = Event.search({}, order_params)
      else
        @events = Event.search(search_params, order_params)
      end
    end
    get_response(200)
  end

  private
  def get_response(status=nil)
    events = @events.map do |event|
      EventSerializer.new(event)
    end
    if status.nil?
      respond_with(
        {
          events: events,
          meta: {}
        },
        location: search_api_events_path
      )
    else
      respond_with(
          {
              events: events,
              meta: {}
          },
          location: search_api_events_path,
          status: status
      )
    end

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

  def order_params
    params.require(:order).permit(:field, :direction)
  end
end
