FactoryBot.define do
  factory :order do
    post_code {"123-4567"}
    prefecture_id {Random.rand(2..48)}
    municipalities {Faker::Address.name}
    address {Faker::Address.name}
    building_name {Faker::Address.name}
    phone_num {Faker::Number.leading_zero_number(digits:10)}
    token {Faker::Crypto.sha1}
  end
end
