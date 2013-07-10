require 'spec_helper'

describe NotificationsController do
  describe "POST /commit" do
    it 'routes to notifications#commit' do
      post('/commit').should route_to(controller: 'notifications', action: 'commit')
    end
  end

end
