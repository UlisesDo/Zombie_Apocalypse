class User < ActiveRecord::Base
  attr_accessible :has_weapon, :is_alone, :is_hungry, :latitude, :longitude, :name
end
