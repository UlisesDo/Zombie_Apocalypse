class PlacesController < ApplicationController

  # POST /places/create
  # POST /places/create.json
  def create
    @safe_house = Place.new( :name => params[:name],
                                      :zombie_probability => params[:zombie_probability],
                                      :latitude => params[:latitude],
                                      :longitude => params[:longitude],
                                      :has_weapons => params[:has_weapons],
                                      :has_food => params[:has_food],
                                      :has_people => params[:has_people])

    respond_to do |format|
      if @safe_house.save
        format.json { render :json => { :status => "OK", :response => {:created => true} }}
      else
        format.json { render :json => { :status => "Error", :response => {} }}
      end
    end
  end

  # PUT /places/update
  # PUT /places/update.json
  # place_id is passed as a parameter
  def update
    if params[:place_id]
      @safe_house = Place.find(params[:place_id])
      place_id_present = true
    end

    respond_to do |format|
      if place_id_present && @safe_house.update_attributes( :name => params[:name],
                                                                    :zombie_probability => params[:zombie_probability],
                                                                    :latitude => params[:latitude],
                                                                    :longitude => params[:longitude],
                                                                    :has_weapons => params[:has_weapons],
                                                                    :has_food => params[:has_food],
                                                                    :has_people => params[:has_people])
        format.json { render :json => { :status => "OK", :response => {:updated => true} }}
      else
        format.json { render :json => { :status => "Error", :response => {} }}
      end
    end
  end

  # GET /recommendations
  # GET /recommendations.json
  def recommend_a_place
    # 1- Find the person we are giving the recommendation to (determined by the user_id)
    # 2- Calculate the total VALUE that each place has for that given user (algorithm)
    # 3- Sort by value the array of recommended places
    # 4- Return the data for the user and the array of recommended places in the specified format 
    if params[:user_id]
      @person = User.find(params[:user_id])
    else 
      wrong_user_id = true
    end
    
    unless wrong_user_id
      # The algorithm to calculate the total VALUE of each place returns an array of arrays, where the 1st element is the value
      # of the place which is in the 2nd element.
      array_values_places = calculate_value_of_places(@person)
      @sorted_array_values_places = array_values_places.sort_by { |e| e[0] }.reverse
      
      debugger

      respond_to do |format|
        if wrong_user_id
          format.json { render :json => { :status => "Error", :response => {} }}
        else
          format.json { render :file => "places/recommend_a_place.json.erb", :content_type => 'application/json' }
        end
      end
    end    
    
  end
  
  
 private
  
  def calculate_value_of_places(person)
    # Since the best value places depend on all of their attirbutes according to a weight, we need to check all the possible
    # values, all the posibilities.
    places = Place.all
    array_values_places = []
    
    places.each_with_index do |place, index|
      if place.zombie_probability > 0 && place.zombie_probability < 1
        value =  ZombieApocalypse::Application.config.weight_place_zombie_probability / place.zombie_probability
      elsif place.zombie_probability == 0.0
        # In case the zombie_probability is 0.10 (second best case), value would start with a value of 10 times the
        # weight_place_zombie_probability. If the probability is 0.0 (absolute BEST case as there are no zombies for sure),
        # we make this attribute more important, by multiplying it by 15!
        value = 15 * ZombieApocalypse::Application.config.weight_place_zombie_probability
      else
        # If the zombie_probability is 1.0 (there are zombies for sure) we weight this place negatively
        value = -1 * ZombieApocalypse::Application.config.weight_place_zombie_probability
      end  
      value += ZombieApocalypse::Application.config.weight_place_armory if (place.has_weapon or person.has_weapon)
      value += ZombieApocalypse::Application.config.weight_place_people if (place.has_people && person.is_alone)
      value += ZombieApocalypse::Application.config.weight_place_food if (place.has_food && person.is_hungry)
      # The value for the distance between the place and the person is Inversely Proportional to that distance
      # The weight for the location may be the trickiest to adjust, as we would need to know the most probable range where
      # the latitude/longitude coordenates are to see how they affect the overall value. 
      value += ZombieApocalypse::Application.config.weight_place_location / calculate_distance_between_two_points(place.latitude, place.longitude, person.latitude, person.longitude)
      array_values_places[index] = [value, place]  
    end
    return array_values_places
  end  
  
  def calculate_distance_between_two_points(lat1, lon1, lat2, lon2)
    # Based on the Haversine formula to calculate the distance between 2 points
    dlon = (lon2 - lon1).abs
    dlat = (lat2 - lat1).abs

    dlon_rad = dlon * ZombieApocalypse::Application.config.rad_per_deg
    dlat_rad = dlat * ZombieApocalypse::Application.config.rad_per_deg
    lat1_rad = lat1 * ZombieApocalypse::Application.config.rad_per_deg
    lon1_rad = lon1 * ZombieApocalypse::Application.config.rad_per_deg
    lat2_rad = lat2 * ZombieApocalypse::Application.config.rad_per_deg
    lon2_rad = lon2 * ZombieApocalypse::Application.config.rad_per_deg

    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

    distance_meters = ZombieApocalypse::Application.config.rad_meters * c     # distance in meters
  end
  
end
