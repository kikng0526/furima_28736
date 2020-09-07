FactoryBot.define do
  factory :user_furima do
    postal_code        { '123-4567' }
    area_id            { 3 }
    city               { '板橋区' }
    address_line       { '1-1' }
    building_name      { '東京ハイツ' }
    phone_number       { 11111111111 }
    token              { 'tok_ac807136aa3f49f57e416d582855' }
  end
end
