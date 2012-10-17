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
    
  end
  
end
