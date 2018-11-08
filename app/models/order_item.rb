class OrderItem < ApplicationRecord
  monetize :price_cents
  belongs_to :course_edition
end
