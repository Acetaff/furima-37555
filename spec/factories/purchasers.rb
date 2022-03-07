FactoryBot.define do
  factory :purchaser do
    post_code {123-4567}
    prefecture_id {Random.rand(2..48)}
    municipalities {Faker::Address.name}
    address {Faker::Address.name}
    building_name {Faker::Address.name}
    phone_num {00000000000}
    association :product_purchase
  end
end
