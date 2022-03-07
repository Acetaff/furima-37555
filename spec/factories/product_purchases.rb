FactoryBot.define do
  factory :product_purchase do
    association :user
    association :item
  end
end
