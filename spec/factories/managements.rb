FactoryBot.define do
  factory :management do
    association :product
    association :user
  end
end
