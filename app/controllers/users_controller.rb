class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path(@user), notice: "User created!"
    else
      render 'new'
    end
  end

  def show
  	@user = current_user
    @location_settings = @user.location_settings.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if current_user.id == @user.id && @user.update_attributes(params[:user])
      redirect_to profile_path(current_user), notice: "User updated!"
    else
      render 'edit'
    end
  end

end
