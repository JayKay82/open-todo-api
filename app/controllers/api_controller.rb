class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: "Data not available", status: 404
  end

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      @current_user = User.find_by(username: username, password: password)
      @current_user.present?
    end
  end

  def current_user
    @current_user
  end
end
