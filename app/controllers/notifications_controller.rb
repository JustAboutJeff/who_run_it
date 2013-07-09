class NotificationsController < ApplicationController

  def commit
    notification = Notification.find_by_id(params[:id])
    if notification.committed == 0
      notification.update_attributes(committed: 1)
    else
      notification.update_attributes(committed: 0)
    end  
    render :json => notification.committed
  end
end
