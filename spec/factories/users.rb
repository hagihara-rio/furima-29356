FactoryBot.define do
  factory :user do
    nickname                        {Faker::Name.initials(number: 2)}
    email                           {Faker::Internet.free_email}
    password                        {Faker::Internet.password(min_length: 6)}
    password_confirmation           {password}
    last_name                       {Gimei.last.kanji}
    first_name                      {Gimei.first.kanji}
    last_name_kana                  {Gimei.last.katakana}
    first_name_kana                 {Gimei.first.katakana}
    birthdate                       {Faker::Date.backward}
  end
end

