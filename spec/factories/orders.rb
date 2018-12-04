FactoryBot.define do
  factory :order do
    association :owner, factory: :user
    trait :pending do
      status { Order::PENDING_ORDER_STATUS }
    end
    trait :confirmed do
      status { Order::CONFIRMED_ORDER_STATUS }
    end
  end
end
