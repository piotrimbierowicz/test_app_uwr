FactoryBot.define do
  factory :author do
    name { Faker::Fallout.character }
  end
end