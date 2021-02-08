FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '新宿区' }
    address { '早稲田3-3' }
    building_name { '東京ハイツ' }
    phone_number { '11111111111' }
  end
end