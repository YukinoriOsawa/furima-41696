class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
 
  def index
    @purchase_address = PurchaseAddress.new 
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
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
    ).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def set_item
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end