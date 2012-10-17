require 'spec_helper'

describe "places/new" do
  before(:each) do
    assign(:place, stub_model(Place,
      :name => "MyString",
      :zombie_probability => 1.5,
      :latitude => 1.5,
      :longitude => 1.5,
      :has_weapon => false,
      :has_food => false,
      :has_people => false
    ).as_new_record)
  end

  it "renders new place form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => places_path, :method => "post" do
      assert_select "input#place_name", :name => "place[name]"
      assert_select "input#place_zombie_probability", :name => "place[zombie_probability]"
      assert_select "input#place_latitude", :name => "place[latitude]"
      assert_select "input#place_longitude", :name => "place[longitude]"
      assert_select "input#place_has_weapon", :name => "place[has_weapon]"
      assert_select "input#place_has_food", :name => "place[has_food]"
      assert_select "input#place_has_people", :name => "place[has_people]"
    end
  end
end
