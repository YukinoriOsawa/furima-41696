class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, 
      :description, 
      :price, 
      :image, 
      :category_id, 
      :status_id, 
      :shipping_cost_id, 
      :shipping_area_id, 
      :shipping_day_id
    ).merge(user_id: current_user.id)
  end
end

