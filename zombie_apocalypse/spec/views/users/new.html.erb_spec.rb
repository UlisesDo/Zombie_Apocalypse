require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :has_weapon => false,
      :is_hungry => false,
      :is_alone => false
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_latitude", :name => "user[latitude]"
      assert_select "input#user_longitude", :name => "user[longitude]"
      assert_select "input#user_has_weapon", :name => "user[has_weapon]"
      assert_select "input#user_is_hungry", :name => "user[is_hungry]"
      assert_select "input#user_is_alone", :name => "user[is_alone]"
    end
  end
end
