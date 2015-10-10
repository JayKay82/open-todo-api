class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    lists = current_user.lists.all
    render json: lists, each_serializer: ListSerializer, status: 200
  end

  def create
    list = current_user.lists.build(list_params)

    if list.save
      render json: list, status: 201
    else
      render json: list.errors.full_messages, status: 422
    end
  end

  def update
    if list.update(list_params)
      render json: list, status: 200
    else
      render json: list.errors.full_messages, status: 422
    end
  end

  def destroy
    begin
      list.delete
      head 204
    rescue
      render json: {}, status: 404
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :permissions)
  end

  def list
    @list ||= current_user.lists.find(params[:id])
  end
end
