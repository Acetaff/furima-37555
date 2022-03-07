class ProductPurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  
  def index
    set_item
    order_inspection
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    set_item
    order_inspection
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
    if current_user.id == @item.user.id || @item.product_purchase.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
