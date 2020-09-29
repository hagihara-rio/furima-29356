FactoryBot.define do
  factory :order_address do
    user_id { '鈴木' }
    item_id { 'スズキ' }
    postal_code { 'suzuki' }
    prefecture_id{ '123-4567' }
    city { 1 }
    address { '東京都' }
    phone_number { '1-1' }

  end
end
