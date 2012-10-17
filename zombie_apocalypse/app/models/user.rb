class User < ActiveRecord::Base
  attr_accessible :has_weapon, :is_alone, :is_hungry, :latitude, :longitude, :name
  
  validates :name,  presence: true
  validates :latitude,  presence: true
  validates :longitude,  presence: true
  validates :is_hungry, :inclusion => {:in => [true, false]}
  validates :is_alone, :inclusion => {:in => [true, false]}
  validates :has_weapon, :inclusion => {:in => [true, false]}
  
end
