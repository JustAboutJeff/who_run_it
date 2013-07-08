class SessionsController < ApplicationController

  # GET /login
  def new
    @user = User.new
  end

  # POST /login
  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to profile_path(current_user)
    else
      redirect_to login_path
    end
  end

  # DELETE /logout
  def destroy
    session.clear
    redirect_to root_path
  end
end