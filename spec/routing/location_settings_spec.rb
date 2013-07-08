require 'spec_helper'

describe LocationSettingsController do

  describe "GET /location_settings" do
    it 'routes to location_settings#index' do
      get('/location_settings').should route_to(controller: 'location_settings', action: 'index')
    end
  end

  describe "GET /location_settings/new" do
    it 'routes to location_settings#new' do
      get('/location_settings/new').should route_to(controller: 'location_settings', action: 'new')
    end
  end

  describe "POST /location_settings" do
    it 'routes to location_settings#create' do
      post('/location_settings').should route_to(controller: 'location_settings', action: 'create')
    end
  end

  describe "GET /location_settings/:id" do
    it 'routes to location_settings#show' do
      get('/location_settings/1').should route_to(controller: 'location_settings', action: 'show', id: '1')
    end
  end
end
