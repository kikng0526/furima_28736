FactoryBot.define do
  factory :product do
    name                { '山' }
    text                { 'きれいな山です' }
    price               { 100_000 }
    category_id         { 2 }
    status_id           { 1 }
    burden_id           { 2 }
    area_id             { 2 }
    day_id              { 2 }
    association :user
  end
end
