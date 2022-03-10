class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_one          :product_purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options presence: true, numericality: { other_than: 1 , message: "を入力してください"} do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "が無効な値です"}

end
