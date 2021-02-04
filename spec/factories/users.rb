FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {"monkey"}
    first_name {"不思議"}
    last_name  {"摩訶"}
    first_name_katakana {"フシギ"}
    last_name_katakana {"マカ"}
    birthday {"2020/01/01"} 
  end
end