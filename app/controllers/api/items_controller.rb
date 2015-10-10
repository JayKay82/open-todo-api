class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
    items = list.items.all
    render json: items, each_serializer: ItemSerializer, status: 200
  end

  def create
    item = list.items.build(item_params)

    if item.save
      render json: item, status: 201
    else
      render json: item.errors.full_messages, status: 422
    end
  end

  def update
    if item.toggle_completed
      render json: item, status: 200
    else
      render json: item.errors.full_messages, status: 422
    end
  end

  def destroy
    if item.destroy
      head 204
    else
      render json: item.errors.full_messages, status: 404
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def list
    @list ||= current_user.lists.find(params[:list_id])
  end

  def item
    @item ||= list.items.find(params[:id])
  end
end
