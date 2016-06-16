require 'rails_helper'

RSpec.describe "api/v1s/show", type: :view do
  before(:each) do
    @api_v1 = assign(:api_v1, Restaurant.create!(
      :name => "Name",
      :description => "MyText",
      :email => "Email",
      :phone => "Phone",
      :street => "Street",
      :city => "City",
      :zip_code => "Zip Code",
      :province => "Province",
      :restaurant_owner_id => "Restaurant Owner",
      :lat => "Lat",
      :lgt => "Lgt"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/Province/)
    expect(rendered).to match(/Restaurant Owner/)
    expect(rendered).to match(/Lat/)
    expect(rendered).to match(/Lgt/)
  end
end
