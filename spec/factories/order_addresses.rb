FactoryBot.define do
  factory :order_address do
    user_id                { "10" }
    item_id                { "10" }
    postal_code            { "123-4567" }
    prefecture_id          { "14" }
    city                   { "東京都世田谷区" }
    address                { "玉川1-1-1" }
    building_name          { "二子玉川マンション" }
    phone_number           { "09012345678" }
    token                  { "sk_test_8acf5c210875ce0e9b6af5b0" }

  end
end
