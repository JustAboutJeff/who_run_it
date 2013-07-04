class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # TODO: authentication and session
  end
end
