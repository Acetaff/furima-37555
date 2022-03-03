class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_num, :user_id, :item_id, :product_purchase_id

  with_options prefecture: true do
    validates :user_id
    validates :item_id
  end

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/, message: "is invalid. hyphen(-)"}
    validates :product_purchase_id
  end

end