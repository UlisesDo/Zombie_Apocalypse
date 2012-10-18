require 'spec_helper'

describe Place do
  before do
    @place = Place.new(:name => "prueba", :longitude => 2.76, :latitude => 1.45, :has_weapon => true, :has_people => true, :has_food => false,:zombie_probability => 0.3)
  end

  subject { @place }
  
  it { should respond_to(:name) }
  it { should respond_to(:longitude) }
  it { should respond_to(:latitude) }
  it { should respond_to(:has_weapon) }
  it { should respond_to(:has_people) }
  it { should respond_to(:has_food) }
  it { should respond_to(:zombie_probability) }
  it { should be_valid }
  
  describe "when name is not present" do
    before { @place.name = " " }
    it { should_not be_valid }
  end
  describe "when longitude is not present" do
    before { @place.longitude = "" }
    it { should_not be_valid }
  end
  describe "when latitude is not present" do
    before { @place.latitude = "" }
    it { should_not be_valid }
  end
  describe "when zombie_probability is not present" do
    before { @place.zombie_probability = "" }
    it { should_not be_valid }
  end
  
end
