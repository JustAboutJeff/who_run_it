require 'spec_helper'

describe UsersController do

  describe "GET /users" do
    it 'routes to users#index' do
      get('/users').should route_to(controller: 'users', action: 'index')
    end
  end

  describe "POST /users" do
    it 'routes to users#create' do
      post('/users').should route_to(controller: 'users', action: 'create')
    end
  end

  describe "GET /users/new" do
    it 'routes to users#new' do
      get('/users/new').should route_to(controller: 'users', action: 'new')
    end
  end

  describe "GET /users/:id/edit" do
    it 'routes to users#edit' do
      get('/users/1/edit').should route_to(controller: 'users', action: 'edit', id: '1')
    end
  end

  describe "GET /users/:id" do
    it 'routes to users#show' do
      get('/users/1').should route_to(controller: 'users', action: 'show', id: '1')
    end
  end

  describe "PUT /users/:id" do
    it 'routes to users#update' do
      put('/users/1').should route_to(controller: 'users', action: 'update', id: '1')
    end
  end

  describe "DELETE /users/:id" do
    it 'routes to users#destroy' do
      delete('/users/1').should route_to(controller: 'users', action: 'destroy', id: '1')
    end
  end

end
