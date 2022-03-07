class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{10,11}\z/, message: "には１０桁以上・11桁以内の半角数字を入力して下さい"}
  end

  def save
    order = ProductPurchase.create(user_id: user_id, item_id: item_id)
    Purchaser.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_num: phone_num, product_purchase_id: order.id)
  end

end