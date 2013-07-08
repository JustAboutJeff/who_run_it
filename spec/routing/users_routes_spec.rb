require 'spec_helper'

describe UsersController do

  describe "GET /users" do
    it 'routes to users#new' do
      get('/users').should route_to(controller: 'users', action: 'new')
    end
  end

  describe "GET /users" do
    it 'routes to users#create' do
      post('/users').should route_to(controller: 'users', action: 'create')
    end
  end

  describe "GET /users/:id" do
    it 'routes to users#show' do
      get('/users/1').should route_to(controller: 'users', action: 'show', id: '1')
    end
  end
end
