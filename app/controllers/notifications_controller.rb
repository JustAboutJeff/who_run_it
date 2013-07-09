class NotificationsController < ApplicationController

  def commit
    notification = Notification.find_by_id(params[:id])
    notification.toggle!(:committed)    
    render :json => notification.committed
  end
end
