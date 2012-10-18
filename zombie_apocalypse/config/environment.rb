# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ZombieApocalypse::Application.initialize!

# Configuration of the weights of the attributes of places in order to get the best recommended place with best value
ZombieApocalypse::Application.config.weight_place_zombie_probability = 3 # its effect grows very quickly
ZombieApocalypse::Application.config.weight_place_location = 200 # its effect weaks very quickly with the distance (in meters)
ZombieApocalypse::Application.config.weight_place_armory = 40 # This is key, in order to defend from zombies
ZombieApocalypse::Application.config.weight_place_food = 20 # important when you are hungry
ZombieApocalypse::Application.config.weight_place_people = 5

# Configuration of constants needed for the calculate_distance_between_two_points method
ZombieApocalypse::Application.config.rad_per_deg = 0.017453293  #  PI/180
ZombieApocalypse::Application.config.rad_meters = 6371000  # Radius in meters
