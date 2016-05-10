require 'rails_helper'

RSpec.describe RestaurantOwner, type: :model do
  before do
    @restaurant_owner = FactoryGirl.build(:restaurant_owner)
  end

  subject { @restaurant_owner }

  it { expect(subject).to respond_to(:name) }
  it { expect(subject).to respond_to(:surname) }
  it { expect(subject).to respond_to(:full_name) }
  it { expect(subject).to respond_to(:email) }
  it { expect(subject).to respond_to(:username) }
end
