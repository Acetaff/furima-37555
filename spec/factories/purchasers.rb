FactoryBot.define do
  factory :purchaser do
    post_code {123-4567}
    prefecture {Random.rand(2..48)}
    municipalities {Faker::Address.name}
    address {Faker::Address.name}
    building_name {Fakser::Address.name}
    phone_num {Faker::Number.number(11,12)}
    association :product_purchase
  end
end
