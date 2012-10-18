require 'spec_helper'

describe User do
  before do
    @user = User.new(:name => "amigo", :longitude => 6.14, :latitude => 3.15, :has_weapon => true, :is_alone=> true, :is_hungry=> false)
  end

  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:longitude) }
  it { should respond_to(:latitude) }
  it { should respond_to(:has_weapon) }
  it { should respond_to(:is_alone) }
  it { should respond_to(:is_hungry) }
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  describe "when longitude is not present" do
    before { @user.longitude = "" }
    it { should_not be_valid }
  end
  describe "when latitude is not present" do
    before { @user.latitude = "" }
    it { should_not be_valid }
  end
  
end
