require 'spec_helper'

describe UsersController do
  describe "GET /profile" do
    it 'routes to users#show' do
      get('/profile').should route_to(controller: 'users', action: 'show')
    end
  end
end
