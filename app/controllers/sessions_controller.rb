class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to profile_path(current_user), notice: "Logged in!"
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path, alert: "Logged out!"
  end
end
