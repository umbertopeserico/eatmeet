# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string           not null
#  text_menu     :text
#  html_menu     :text
#  max_price     :decimal(20, 2)   default(0.0)
#  min_price     :decimal(20, 2)   default(0.0)
#  restaurant_id :integer          not null
#

require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryGirl.build(:menu)
  end

  subject { @menu }

  it { expect(subject).to respond_to(:title) }
  it { expect(subject).to respond_to(:text_menu) }
  it { expect(subject).to respond_to(:html_menu) }
  it { expect(subject).to respond_to(:max_price) }
  it { expect(subject).to respond_to(:min_price) }
  it { expect(subject).to respond_to(:restaurant) }
  it { expect(subject).to respond_to(:events) }

  describe 'title' do
    describe 'empty' do
      before do
        subject.title = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'restaurant' do
    describe 'empty' do
      before do
        subject.restaurant = nil
      end

      it { expect(subject).not_to be_valid }
    end
  end

  describe 'text menu' do
    before do
      subject.html_menu = "<b>Menu description</b>"
      subject.save
    end

    it { expect(subject.text_menu).to be == ActionView::Base.full_sanitizer.sanitize(subject.html_menu) }
  end
end
