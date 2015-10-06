class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    list = user.lists.build(list_params)

    if list.save
      render json: list, status: 201
    else
      render json: { errors: list.errors.full_messages }, status: 422
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.delete
      render json: {}, status: 204
    rescue
      render json: {}, status: 404
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :permissions)
  end

  def user
    User.find(params[:user_id])
  end
end
