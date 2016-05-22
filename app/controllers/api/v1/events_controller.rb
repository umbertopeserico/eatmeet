class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :participants]

  respond_to :json

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def participants
    @users = @event.users
    render 'users/index'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
end
