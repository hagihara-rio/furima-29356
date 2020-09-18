FactoryBot.define do

  factory :item do
    itemname              { Faker::Lorem.sentence }
    detail                { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2,to: 10) }
    condition_id          { Faker::Number.between(from: 2,to: 7) }
    shipping_fee_id       { Faker::Number.between(from: 2,to: 3) }
    shipping_area_id      { Faker::Number.between(from: 2,to: 48) }
    shipping_day_id       { Faker::Number.between(from: 2,to: 4) }
    price                 { Faker::Number.between(from: 300,to: 9999999) }
    association :user 
  end

end

