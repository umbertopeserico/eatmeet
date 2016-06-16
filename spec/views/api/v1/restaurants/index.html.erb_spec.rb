require 'rails_helper'

RSpec.describe "api/v1s/index", type: :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
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
      ),
      Restaurant.create!(
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
      )
    ])
  end

  it "renders a list of api/v1s" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "Province".to_s, :count => 2
    assert_select "tr>td", :text => "Restaurant Owner".to_s, :count => 2
    assert_select "tr>td", :text => "Lat".to_s, :count => 2
    assert_select "tr>td", :text => "Lgt".to_s, :count => 2
  end
end
