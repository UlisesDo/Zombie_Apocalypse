class UsersController < ApplicationController

  # POST /users/create
  # POST /users/create.json
  def create
    # I am not sure of the name of the object received in params by the API, it may be person or user. 
    # I am assumming it's user for now
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.json { render :json => { :status => "OK", :response => {:created => true} }}
      else
        format.json { render :json => { :status => "Error", :response => {} }}
      end
    end
  end

  # PUT /users/update
  # PUT /users/update.json
  def update
    if params[:user_id]
      @user = User.find(params[:user_id])
      user_id_present = true
    end
    
    respond_to do |format|
      if user_id_present && @user.update_attributes(params[:user])
        format.json { render :json => { :status => "OK", :response => {:updated => true} }}
      else
        format.json { render :json => { :status => "Error", :response => {} }}
      end
    end
  end

end
