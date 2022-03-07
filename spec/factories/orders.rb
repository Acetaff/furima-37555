FactoryBot.define do
  factory :order do
    post_code {"123-4567"}
    prefecture_id {Random.rand(2..48)}
    municipalities {"某市"}
    address {"某所"}
    building_name {"何某"}
    phone_num {Faker::Number.leading_zero_number(digits:10)}
    token {Faker::Crypto.sha1}
  end
end
