class Course < ApplicationRecord
  has_many :course_editions
  monetize :price_cents
end
