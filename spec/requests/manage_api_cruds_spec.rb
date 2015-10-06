require 'rails_helper'

RSpec.describe "Manage API CRUD", type: :request do
  include OpenToDoHelper

  before do
    @user = create(:user)
    @list = create(:list)
    http_login(@user.username, @user.password)
  end

  describe "POST" do
    it "successfully creates a new user" do
      post 'http://localhost:3000/api/users', {user: { username: 'Batman', password: 'Alfred' } }, @env
      expect_status(201)
      expect_json(username: 'Batman', password: 'Alfred')
    end

    it "successfully creates a new list" do
      post "http://localhost:3000/api/users/#{@user.id}/lists", {list: { name: 'Shopping List', permissions: 'Private' } }, @env
      expect_status(201)
      expect_json(name: 'Shopping List')
    end

    it "successfully creates a new item" do
      post "http://localhost:3000/api/lists/#{@list.id}/items", {item: { name: 'Apples' } }, @env
      expect_status(201)
      expect_json(name: 'Apples')
    end

    it "throws an error when trying to create a user with a missing attribute" do
      post 'http://localhost:3000/api/users', {user: { username: nil, password: 'Alfred' } }, @env
      expect(response).to have_http_status(422)
      expect(response.body).to include("Username can't be blank")
    end
  end
end
