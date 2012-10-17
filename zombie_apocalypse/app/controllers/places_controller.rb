class PlacesController < ApplicationController

  # POST /places/create
  # POST /places/create.json
  def create
    # I am not sure of the name of the object received in params by the API, it may be safe_house or place. 
    # I am assumming it's place for now
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.json { render :json => { :status => "OK", :response => {:created => true} }}
      else
        format.json { render :json => { :status => "Error", :response => {} }}
      end
    end
  end

  # PUT /places/update
  # PUT /places/update.json
  # user_id is passed as a parameter
  def update
    if params[:place_id]
      @place = Place.find(params[:place_id])
      place_id_present = true
    end

    respond_to do |format|
      if place_id_present && @place.update_attributes(params[:place])
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
