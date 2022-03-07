FactoryBot.define do
  factory :product_purchase do
    association :user
    association :item
    association :purchaser
  end
end
