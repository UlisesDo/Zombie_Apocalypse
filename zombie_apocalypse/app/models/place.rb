class Place < ActiveRecord::Base
  attr_accessible :has_food, :has_people, :has_weapon, :latitude, :longitude, :name, :zombie_probability
end
