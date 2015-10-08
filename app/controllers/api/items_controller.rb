class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    item = list.items.build(item_params)

    if item.save
      render json: item, status: 201
    else
      render json: { errors: item.errors.full_messages }, status: 422
    end
  end

  def complete
    item = list.items.where(name: params[:item][:name]).first
    if item.mark_completed
      render json: item, status: 200
    else
      render json: item.errors.full_messages, status: 422
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def list
    @list ||= List.find(params[:list_id])
  end
end
