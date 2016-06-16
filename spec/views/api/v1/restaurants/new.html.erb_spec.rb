require 'rails_helper'

RSpec.describe "api/v1s/new", type: :view do
  before(:each) do
    assign(:api_v1, Restaurant.new(
      :name => "MyString",
      :description => "MyText",
      :email => "MyString",
      :phone => "MyString",
      :street => "MyString",
      :city => "MyString",
      :zip_code => "MyString",
      :province => "MyString",
      :restaurant_owner_id => "MyString",
      :lat => "MyString",
      :lgt => "MyString"
    ))
  end

  it "renders new api_v1 form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input#api_v1_name[name=?]", "api_v1[name]"

      assert_select "textarea#api_v1_description[name=?]", "api_v1[description]"

      assert_select "input#api_v1_email[name=?]", "api_v1[email]"

      assert_select "input#api_v1_phone[name=?]", "api_v1[phone]"

      assert_select "input#api_v1_street[name=?]", "api_v1[street]"

      assert_select "input#api_v1_city[name=?]", "api_v1[city]"

      assert_select "input#api_v1_zip_code[name=?]", "api_v1[zip_code]"

      assert_select "input#api_v1_province[name=?]", "api_v1[province]"

      assert_select "input#api_v1_restaurant_owner_id[name=?]", "api_v1[restaurant_owner_id]"

      assert_select "input#api_v1_lat[name=?]", "api_v1[lat]"

      assert_select "input#api_v1_lgt[name=?]", "api_v1[lgt]"
    end
  end
end
