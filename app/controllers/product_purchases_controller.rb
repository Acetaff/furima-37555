class ProductPurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.reqire(:order).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_num, :item_id).merge(user_id: current_user.id)
  end
  
end
