class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_num, :user_id, :item_id, :product_purchase_id
end