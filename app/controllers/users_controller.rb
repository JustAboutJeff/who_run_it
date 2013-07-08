class UsersController < ApplicationController

  # GET /users
  def new
    @user = User.new
  end

  # POST /users
  def create
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to '/profile'
    else
      render :new
    end
  end

  # GET /users/:id
  def show
  	@user = current_user
    @location_settings = @user.location_settings.all
  end
end
