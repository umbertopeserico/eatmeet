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
end
