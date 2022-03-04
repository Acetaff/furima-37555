class ProductPurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :order_inspection
  
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_num).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_inspection
    @item = Item.includes(:user)
    if current_user.id == @item.user.id || @item.id == @item.product_purchase[:item_id]
      redirect_to root_path
    end
  end
  
end
