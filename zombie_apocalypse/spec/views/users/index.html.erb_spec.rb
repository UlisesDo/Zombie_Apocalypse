require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :latitude => 1.5,
        :longitude => 1.5,
        :has_weapon => false,
        :is_hungry => false,
        :is_alone => false
      ),
      stub_model(User,
        :name => "Name",
        :latitude => 1.5,
        :longitude => 1.5,
        :has_weapon => false,
        :is_hungry => false,
        :is_alone => false
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
