class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    users = User.all

    render json: users, each_serializer: UserSerializer
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      user.destroy
      render json: {}, status: 204
    rescue
      render json: {}, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
