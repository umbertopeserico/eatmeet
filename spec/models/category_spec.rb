# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryGirl.build(:category)
  end

  subject { @category }

  it { expect(subject).to respond_to(:name) }
  it { expect(subject).to respond_to(:events) }
  it { expect(subject).to respond_to(:events_count) }
  it { expect(subject).to respond_to(:image) }

  describe 'name' do
    describe 'empty' do
      before { @category.name = '' }

      it { expect(subject).not_to be_valid }
    end

    describe 'unique' do
      before do
        dup = @category.dup
        dup.save
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'events_count' do
    before do
      @restaurant_owner = FactoryGirl.create(:restaurant_owner)
      @restaurant = FactoryGirl.create(:restaurant, restaurant_owner: @restaurant_owner)
      @menu = FactoryGirl.create(:menu, restaurant: @restaurant)
      @event = FactoryGirl.create(:event, menu: @menu)
      subject.events << @event
      subject.save
    end

    it 'should return the number of event for that category' do
      expect(subject.events_count).to be == 1
    end
  end
end
