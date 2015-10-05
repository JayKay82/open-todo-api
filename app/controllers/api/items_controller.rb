class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    item = list.items.build(item_params)

    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: 422
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def list
    List.find(params[:list_id])
  end
end
