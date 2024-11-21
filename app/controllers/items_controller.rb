class ItemsController < ApplicationController
  def index
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      render :new
    end
  end
end
