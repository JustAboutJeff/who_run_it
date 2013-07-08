require 'spec_helper'

describe EventsController do

  describe "GET /" do
    it 'routes to events#new' do
      get('/').should route_to(controller: 'events', action: 'new')
    end
  end

  describe "GET /events" do
    it 'routes to events#index' do
      get('/events').should route_to(controller: 'events', action: 'index')
    end
  end

  describe "POST /events" do
    it 'routes to events#create' do
      post('/events').should route_to(controller: 'events', action: 'create')
    end
  end

  describe "GET /events/new" do
    it 'routes to events#new' do
      get('/events/new').should route_to(controller: 'events', action: 'new')
    end
  end

  describe "GET /events/:id/edit" do
    it 'routes to events#edit' do
      get('/events/1/edit').should route_to(controller: 'events', action: 'edit', id: '1')
    end
  end

  describe "GET /events/:id" do
    it 'routes to events#show' do
      get('/events/1').should route_to(controller: 'events', action: 'show', id: '1')
    end
  end

  describe "PUT /events/:id" do
    it 'routes to events#update' do
      put('/events/1').should route_to(controller: 'events', action: 'update', id: '1')
    end
  end

  describe "DELETE /events/:id" do
    it 'routes to events#destroy' do
      delete('/events/1').should route_to(controller: 'events', action: 'destroy', id: '1')
    end
  end
end
