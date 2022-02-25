class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_day_id

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, format: { with: /\A[300-9999999]+\z/, message: 'には(￥300〜￥9,999,999)までの"半角数字"を入力してください'}
  end
end
