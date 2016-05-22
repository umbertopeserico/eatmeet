class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :events]

  respond_to :json

  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def events
    @events = @category.events
    render 'events/index'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end
