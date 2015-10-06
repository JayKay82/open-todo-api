require 'rails_helper'

RSpec.describe "Manage API CRUD", type: :request do
  include OpenToDoHelper

  before do
    user = create(:user)
    http_login(user.username, user.password)
  end

  describe "POST" do
    it "successfully creates a new user" do
      post 'http://localhost:3000/api/users', {user: { username: 'Batman', password: 'Alfred' } }, @env
      expect(response).to have_http_status(201)
    end

    it "throws an error when trying to create an object with a missing attribute" do
      post 'http://localhost:3000/api/users', {user: { username: nil, password: 'Alfred' } }, @env
      expect(response).to have_http_status(422)
      expect(response.body).to include("Username can't be blank")
    end
  end
end
