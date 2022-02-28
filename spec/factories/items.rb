FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {Ctegory.id}
    status_id {Status.id}
    burden_id {Burden.id}
    prefecture_id {Prefecture.id}
    shipping_day_id {ShippingDay.id}
    price {Random.rand(300..9999999)}
    association :user
  end
end
