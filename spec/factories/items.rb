FactoryBot.define do
  factory :item do
    name {"商品名"}
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    category_id {Faker::Number.number}
    condition_id {Faker::Number.number}
    delivery_fee_id {Faker::Number.number}
    prefectures_id {Faker::Number.number}
    delivery_days_id {Faker::Number.number}
    price {300}
    association :user
  end
end
