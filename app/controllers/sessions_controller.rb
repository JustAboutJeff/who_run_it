class SessionsController < ApplicationController

  def new
    if params[:event_url]
      @event = Event.find_by_url_key(params[:event_url])
    end
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if params[:event_url]
        redirect_to event_path(params[:event_url])
      else
        redirect_to profile_path(current_user), notice: "Logged in!"
      end
    else
      if params[:event_url]
        redirect_to login_path(event_url: params[:event_url])
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path, alert: "Logged out!"
  end
end
