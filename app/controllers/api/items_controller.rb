class Api::ItemsController < ApiController
  before_action :authenticated?, only:[:create]
  before_action :authenticated_for_item_index?, only:[:index]
  before_action :authenticated_for_item?, only:[:update, :destroy]

  def index
    items = Item.where('list_id = ?', params[:list_id])
    render json: items, each_serializer: ItemSerializer
  end

  def create
    item = Item.new(item_params)
    item.list_id = params[:list_id]

    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
     render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      item = Item.find(params[:id])
      item.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end


  private
  def item_params
    params.require(:item).permit(:list_id, :description, :completed)
  end

end
