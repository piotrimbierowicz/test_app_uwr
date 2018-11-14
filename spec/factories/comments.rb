FactoryBot.define do
  factory :comment do
    content { Faker::Fallout.quote }
  end
end
