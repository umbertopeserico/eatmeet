class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :events]
  #before_action :authenticate_user!

  respond_to :json

  def index
    @categories = Category.all
    categories = @categories.map do |category|
      CategorySerializer.new(category)
    end
    respond_with(categories)
    #respond_with(
    #    {
    #        categories: categories,
    #        meta: {
    #            total: @categories.count
    #        }
    #    }
    #)
  end

  def show
    respond_with(@category)
  end

  def events
    @events = @category.events
    respond_with (@events)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end
