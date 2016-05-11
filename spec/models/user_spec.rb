# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#  surname    :string           not null
#  full_name  :string
#  email      :string           not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.build(:user)
  end

  subject { @user }

  it { expect(subject).to respond_to(:name) }
  it { expect(subject).to respond_to(:surname) }
  it { expect(subject).to respond_to(:full_name) }
  it { expect(subject).to respond_to(:email) }
  it { expect(subject).to respond_to(:events) }

  describe 'name' do
    describe 'empty' do
      before do
        subject.name=nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'surname' do
    describe 'empty' do
      before do
        subject.surname=nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'email' do
    describe 'empty' do
      before do
        subject.email = nil
      end

      it { expect(subject).not_to be_valid }
    end

    describe 'duplicate' do
      before do
        @dup_user = subject.dup
        @dup_user.save!
      end

      it { expect(subject).not_to be_valid }

      describe 'case sensitive' do
        before do
          @dup_user.email.upcase!
          @dup_user.save!
        end

        it { expect(subject).not_to be_valid }
      end
    end
  end

  describe 'full_name' do
    before do
      subject.save
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
end
