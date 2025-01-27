# == Schema Information
#
# Table name: restaurant_owners
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  surname                :string           not null
#  full_name              :string
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#

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
  it { expect(subject).to respond_to(:password) }
  it { expect(subject).to respond_to(:password_confirmation) }
  it { expect(subject).to respond_to(:restaurants) }

  describe 'name' do
    describe 'empty' do
      before do
        @restaurant_owner.name = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'surname' do
    describe 'empty' do
      before do
        @restaurant_owner.surname = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'email' do
    describe 'empty' do
      before do
        @restaurant_owner.email = nil
      end

      it { expect(subject).not_to be_valid }
    end

    describe 'duplicate' do
      before do
        @dup_restaurant_owner = @restaurant_owner.dup
        @dup_restaurant_owner.save!
      end

      it { expect(subject).not_to be_valid }

      describe 'case sensitive' do
        before do
          @dup_restaurant_owner.email.upcase!
          @dup_restaurant_owner.save!
        end

        it { expect(subject).not_to be_valid }
      end
    end
  end

  describe 'full_name' do
    before do
      @restaurant_owner.save
    end

    it 'should be equal to #{name} #{surname}' do
      expect(subject.full_name).to be == "#{subject.name} #{subject.surname}"
    end
  end

  describe 'devise' do
    it { expect(subject.devise_modules.include?(:database_authenticatable)).to be true }
    it { expect(subject.devise_modules.include?(:registerable)).to be true }
    it { expect(subject.devise_modules.include?(:confirmable)).to be true }
    it { expect(subject.devise_modules.include?(:recoverable)).to be true }
    it { expect(subject.devise_modules.include?(:rememberable)).to be true }
    it { expect(subject.devise_modules.include?(:trackable)).to be true }
    it { expect(subject.devise_modules.include?(:validatable)).to be true }
    it { expect(subject.devise_modules.include?(:lockable)).to be true }
  end

  describe 'on delete' do
    before do
      @restaurant_owner.save
      @restaurant = FactoryGirl.create(:restaurant, restaurant_owner: @restaurant_owner)
    end

    it do
      old_id = @restaurant_owner.id
      @restaurant_owner.destroy
      expect(Restaurant.where(restaurant_owner_id: old_id).count).to be == 0
    end
  end
end
