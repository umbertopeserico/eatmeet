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
end
