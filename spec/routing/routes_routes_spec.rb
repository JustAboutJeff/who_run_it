require 'spec_helper'

describe RoutesController do
  describe "GET /routes" do
    it 'routes to routes#index' do
      get('/routes').should route_to(controller: 'routes', action: 'index')
    end
  end

  describe "POST /routes" do
    it 'routes to routes#create' do
      post('/routes').should route_to(controller: 'routes', action: 'create')
    end
  end

  describe "GET /routes/new" do
    it 'routes to routes#new' do
      get('/routes/new').should route_to(controller: 'routes', action: 'new')
    end
  end

  describe "GET /routes/:id/edit" do
    it 'routes to routes#edit' do
      get('/routes/1/edit').should route_to(controller: 'routes', action: 'edit', id: '1')
    end
  end

  describe "GET /routes/:id" do
    it 'routes to routes#show' do
      get('/routes/1').should route_to(controller: 'routes', action: 'show', id: '1')
    end
  end

  describe "PUT /routes/:id" do
    it 'routes to routes#update' do
      put('/routes/1').should route_to(controller: 'routes', action: 'update', id: '1')
    end
  end

  describe "DELETE /routes/:id" do
    it 'routes to routes#destroy' do
      delete('/routes/1').should route_to(controller: 'routes', action: 'destroy', id: '1')
    end
  end

  describe "POST /routes/remove" do
    it 'routes to routes#remove' do
      post('/routes/remove').should route_to(controller: 'routes', action: 'remove')
    end
  end

end
