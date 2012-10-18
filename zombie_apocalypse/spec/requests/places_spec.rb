require 'spec_helper'

describe "Places" do
  
  subject { page }
  
  describe "GET /recommendations" do
    
    it "responds with JSON" do
      my_place = stub_model(Place,:save=>true)
      Place.stub(:new).with({:place => {:name => "test place", :longitude => 2.76, :latitude => 1.45, :has_weapon => true, 
                            :has_people => true, :has_food => false, :zombie_probability => 0.3}) { my_place }
      post :create, :my_place => {:place => {:name => "test place", :longitude => 2.76, :latitude => 1.45, :has_weapon => true, 
                                :has_people => true, :has_food => false, :zombie_probability => 0.3}, :format => :json
      response.body.should == my_place.to_json
    end
    
    
    it "It should get /recommendations properly" do
      @expected = { 
        :status => "OK"
      }.to_json
      get recommendations_path, {:user_id => '1')
      parsed_body = JSON.parse(response.body)
      parsed_body.should include @expected
    end
  end
   
end
