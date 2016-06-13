# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  title            :string           not null
#  schedule         :datetime         not null
#  menu_id          :integer          not null
#  max_people       :integer          not null
#  min_people       :integer          not null
#  people_min_price :integer          not null
#  max_price        :decimal(20, 2)   default(0.0)
#  min_price        :decimal(20, 2)   default(0.0)
#  actual_price     :decimal(20, 2)   default(0.0)
#  prices_array     :decimal(, )      is an Array
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryGirl.build(:event)
  end

  subject { @event }

  it { expect(subject).to respond_to(:title) }
  it { expect(subject).to respond_to(:schedule) }
  it { expect(subject).to respond_to(:menu) }
  it { expect(subject).to respond_to(:max_people) }
  it { expect(subject).to respond_to(:min_people) }
  it { expect(subject).to respond_to(:people_min_price) }
  it { expect(subject).to respond_to(:max_price) }
  it { expect(subject).to respond_to(:min_price) }
  it { expect(subject).to respond_to(:actual_price) }
  it { expect(subject).to respond_to(:prices_array) }
  it { expect(subject).to respond_to(:users) }
  it { expect(subject).to respond_to(:participants) }
  it { expect(subject).to respond_to(:participants_count) }
  it { expect(subject).to respond_to(:categories) }
  it { expect(subject).to respond_to(:restaurant) }
  it { expect(subject).to respond_to(:restaurant_owner) }

  describe 'title' do
    describe 'empty' do
      before do
        subject.title = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'schedule' do
    describe 'empty' do
      before do
        subject.schedule = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'menu' do
    describe 'empty' do
      before do
        subject.menu = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'max_people' do
    describe 'empty' do
      before do
        subject.max_people = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'min_people' do
    describe 'empty' do
      before do
        subject.min_people = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'people_min_price' do
    describe 'empty' do
      before do
        subject.people_min_price = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'participants count' do
    before do
      @restaurant_owner = FactoryGirl.create(:restaurant_owner)
      @restaurant = FactoryGirl.create(:restaurant, restaurant_owner: @restaurant_owner)
      @menu = FactoryGirl.create(:menu, restaurant: @restaurant)
      @event = FactoryGirl.create(:event, menu: @menu)
      @user = FactoryGirl.create(:user)
    end

    describe 'on add' do
      it 'should update the participants count' do
        @event.participants << @user
        expect(@event.participants_count).to be == 1
      end
    end

    describe 'on remove' do
      before do
        @event.participants << @user
      end

      it 'should update the participants count' do
        @event.participants.delete(@user)
        expect(@event.participants_count).to be == 0
      end
    end
  end

  describe 'actual sale' do
    before do
      @restaurant_owner = FactoryGirl.create(:restaurant_owner)
      @restaurant = FactoryGirl.create(:restaurant, restaurant_owner: @restaurant_owner)
      @menu = FactoryGirl.create(:menu, restaurant: @restaurant)
      @user = FactoryGirl.create(:user)
    end

    describe 'when participant added' do
      before do
        subject.max_price = 20
        subject.min_price = 10
        subject.people_min_price = 1
        subject.save
        subject.participants << @user
      end
      it 'should update actual sale' do
        expect(subject.actual_sale).to be == 50
      end
    end
  end
end
