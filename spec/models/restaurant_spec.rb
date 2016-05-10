# == Schema Information
#
# Table name: restaurants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string           not null
#  description         :text
#  email               :string           not null
#  phone               :string
#  street              :string
#  city                :string
#  zip_code            :string
#  province            :string
#  full_address        :string
#  restaurant_owner_id :integer          not null
#

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before do
    @restaurant = FactoryGirl.build(:restaurant)
  end

  subject { @restaurant }

  it { expect(subject).to respond_to(:name) }
  it { expect(subject).to respond_to(:description) }
  it { expect(subject).to respond_to(:email) }
  it { expect(subject).to respond_to(:phone) }
  it { expect(subject).to respond_to(:street) }
  it { expect(subject).to respond_to(:city) }
  it { expect(subject).to respond_to(:zip_code) }
  it { expect(subject).to respond_to(:province) }
  it { expect(subject).to respond_to(:full_address) }
  it { expect(subject).to respond_to(:restaurant_owner) }
  it { expect(subject).to respond_to(:zones) }
  it { expect(subject).to respond_to(:menus) }

  describe 'name' do
    describe 'empty' do
      before do
        @restaurant.name = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'email' do
    describe 'empty' do
      before do
        @restaurant.email = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'full_address' do
    before do
      @restaurant.save
    end

    it 'should be equal to #{subject.street}, #{subject.city} #{subject.zip_code} (#{subject.province})' do
      expect(subject.full_address).to be == "#{subject.street}, #{subject.city} #{subject.zip_code} (#{subject.province})"
    end
  end

  describe 'restaurant_owner' do
    describe 'empty' do
      before do
        @restaurant.restaurant_owner = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'on delete' do
    before do
      subject.save
      @menu = FactoryGirl.create(:menu, restaurant: subject)
    end

    it do
      old_id = subject.id
      subject.destroy
      expect(Menu.where(restaurant_id: old_id).count).to be == 0
    end
  end
end
