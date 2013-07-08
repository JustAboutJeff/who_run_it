require 'spec_helper'

describe SessionsController do

  describe "GET /login" do
    it 'routes to sessions#new' do
      get('/login').should route_to(controller: 'sessions', action: 'new')
    end
  end

  describe "POST /login" do
    it 'routes to sessions#create' do
      post('/login').should route_to(controller: 'sessions', action: 'create')
    end
  end

  describe "DELETE /logout" do
    it 'routes to sessions#destroy' do
      delete('/logout').should route_to(controller: 'sessions', action: 'destroy')
    end
  end
end