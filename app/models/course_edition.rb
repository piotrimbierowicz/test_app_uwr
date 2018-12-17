class CourseEdition < ApplicationRecord
  belongs_to :course
  has_many :order_items
end
