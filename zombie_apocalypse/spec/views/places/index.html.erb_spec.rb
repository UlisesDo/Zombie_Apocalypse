require 'spec_helper'

describe "places/index" do
  before(:each) do
    assign(:places, [
      stub_model(Place,
        :name => "Name",
        :zombie_probability => 1.5,
        :latitude => 1.5,
        :longitude => 1.5,
        :has_weapon => false,
        :has_food => false,
        :has_people => false
      ),
      stub_model(Place,
        :name => "Name",
        :zombie_probability => 1.5,
        :latitude => 1.5,
        :longitude => 1.5,
        :has_weapon => false,
        :has_food => false,
        :has_people => false
      )
    ])
  end

  it "renders a list of places" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
