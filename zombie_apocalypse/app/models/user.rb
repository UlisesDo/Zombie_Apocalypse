class User < ActiveRecord::Base
  attr_accessible :has_weapon, :is_alone, :is_hungry, :latitude, :longitude, :name
  
  validates :name,  :presence => { :message => "name is required" }
  validates :latitude,  :presence => { :message => "latitude is required" }
  validates :longitude, :presence => { :message => "longitude is required" }
  validates :is_hungry, :inclusion => {:in => [true, false]}
  validates :is_alone, :inclusion => {:in => [true, false]}
  validates :has_weapon, :inclusion => {:in => [true, false]}
  
end
