class Administrator::Restaurants::PhotosController < ApplicationController
  before_action :set_restaurant
  before_action :set_photo, only: [ :destroy ]

  respond_to :html

  def new
    @photo = @restaurant.photos.new
    respond_with(@photo)
  end

  def create
    @photo = @restaurant.photos.new(photo_params)
    @photo.save
    respond_with(@photo)
  end

  def destroy
    @photo.destroy
    respond_with(@photo)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
  
    def set_photo
      @photo = @restaurant.photos.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:image)
    end
end
