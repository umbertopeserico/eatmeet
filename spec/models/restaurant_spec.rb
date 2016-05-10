require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before do
    @restaurant = FactoryGirl.build(:restaurant)
  end

  subject { @restaurant }

  it { expect(subject).to respond_to(:restaurant_owner) }
end
