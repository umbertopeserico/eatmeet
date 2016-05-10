require 'rails_helper'

RSpec.describe Zone, type: :model do
  before do
    # noinspection RubyArgCount
    @zone = FactoryGirl.build(:zone)
  end

  subject { @zone }

  it { expect(subject).to respond_to(:name) }
end
