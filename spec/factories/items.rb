FactoryBot.define do
  factory :item do
      title {"ポケモン"}
      description {"とても強い"}
      category_id {1}
      item_state_id {1}
      shipping_fee_id {1}
      prefecture_id {1}
      shipping_day_id {1}
      price {5000}
      association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
