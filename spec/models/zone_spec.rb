require 'rails_helper'

RSpec.describe Zone, type: :model do
  before do
    # noinspection RubyArgCount
    @zone = FactoryGirl.build(:zone)
  end

  subject { @zone }

  it { expect(subject).to respond_to(:name) }

  describe 'name' do
    describe 'empty' do
      before do
        @zone.name=nil
      end

      it { expect(subject).not_to be_valid }
    end

    describe 'duplicate' do
      before do
        @dup_zone = @zone.dup
        @dup_zone.save!
      end

      it { expect(subject).not_to be_valid }

      describe 'case sensitive' do
        before do
          @dup_zone.name.upcase!
          @dup_zone.save!
        end

        it { expect(subject).not_to be_valid }
      end
    end
  end
end
