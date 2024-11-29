class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
 
  def index
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.save
      redirect_to root_path, notice: '購入が完了しました。'
    else
      flash.now[:alert] = '購入に失敗しました。入力内容を確認してください。'
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(
      :postal_code, 
      :shipping_area_id, 
      :city, 
      :addresses, 
      :building, 
      :phone_number,
    ).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end