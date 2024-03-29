class Place < ActiveRecord::Base
  attr_accessible :has_food, :has_people, :has_weapon, :latitude, :longitude, :name, :zombie_probability
  
  validates :name, :length => { minimum: 3 }, :presence => { :message => "name is required" }
  validates :latitude,  :presence => { :message => "latitude is required" }
  validates :longitude,  :presence => { :message => "longitude is required" }
  validates :has_food, :inclusion => {:in => [true, false]}
  validates :has_people, :inclusion => {:in => [true, false]}
  validates :has_weapon, :inclusion => {:in => [true, false]}
  validates :zombie_probability,  :presence => { :message => "zombie_probability is required" }
  validate :zombie_probability_is_between_0_and_1
  validates :zombie_probability, :format => { :with => /^\d+??(?:\.\d{0,1})?$/ }, :numericality => true

  def zombie_probability_is_between_0_and_1
      if  zombie_probability < 0 or zombie_probability > 1
          errors.add(:zombie_probability, "zombie_probability must be normalised in the [0.0-1.0] range")
      end
  end
  
end
