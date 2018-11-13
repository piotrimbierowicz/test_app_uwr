FactoryBot.define do
  factory :post do
    title { Faker::Fallout.character }
    content { Faker::Fallout.quote }
    association :author
  end
end