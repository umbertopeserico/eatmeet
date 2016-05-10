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

    describe 'duplicate' do
      before do
        @dup_restaurant = @restaurant.dup
        @dup_restaurant.save!
      end

      it { expect(subject).not_to be_valid }

      describe 'case sensitive' do
        before do
          @dup_restaurant.email.upcase!
          @dup_restaurant.save!
        end

        it { expect(subject).not_to be_valid }
      end
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

end
