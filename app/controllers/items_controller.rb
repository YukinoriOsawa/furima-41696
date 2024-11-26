class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  def index
    # 新しい順に商品を取得 (created_atが新しい順)
    @items = Item.order(created_at: :desc)
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

  def show
     @item = Item.find(params[:id])
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

