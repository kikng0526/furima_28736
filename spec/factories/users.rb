FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { 'test1234' }
    password_confirmation { password }
    first_name            { '鈴木' }
    last_name             { '太郎' }
    first_kana            { 'スズキ' }
    last_kana             { 'タロウ' }
    date                  { Faker::Date.birthday(min_age: 20, max_age: 65) }
  end
end
