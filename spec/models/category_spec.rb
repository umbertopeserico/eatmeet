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
end
