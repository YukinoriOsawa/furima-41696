class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :show, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]


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
  end


def edit
end


  def update
    if @item.update(item_params)
      redirect_to @item, notice: 
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end




  private
  def set_item
    @item = Item.find(params[:id])
  end

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

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

end

