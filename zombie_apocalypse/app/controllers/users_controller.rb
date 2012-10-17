class UsersController < ApplicationController

  # POST /users/create
  # POST /users/create.json
  def create
    @person = User.new( :name => params[:name],
                                 :latitude => params[:latitude],
                                 :longitude => params[:longitude],
                                 :has_weapons => params[:has_weapons],
                                 :is_hungry => params[:is_hungry],
                                 :is_alone => params[:is_alone])

    respond_to do |format|
      if @person.save
        format.json { render :json => { :status => "OK", :response => {:created => true} }}
      else
        format.json { render :json => { :status => "Error", :response => {} }}
      end
    end
  end

  # PUT /users/update
  # PUT /users/update.json
  # user_id is passed as a parameter
  def update
    if params[:user_id]
      @person = User.find(params[:user_id])
      user_id_present = true
    end
    
    respond_to do |format|
      if user_id_present && @user.update_attributes(:name => params[:name],
                                                             :latitude => params[:latitude],
                                                             :longitude => params[:longitude],
                                                             :has_weapons => params[:has_weapons],
                                                             :is_hungry => params[:is_hungry],
                                                             :is_alone => params[:is_alone])
        format.json { render :json => { :status => "OK", :response => {:updated => true} }}
      else
        format.json { render :json => { :status => "Error", :response => {} }}
      end
    end
  end

end
