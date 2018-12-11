class Course < ApplicationRecord
  include PgSearch
  pg_search_scope :search, against: :name,
                           using: {
                             tsearch: { prefix: true, dictionary: 'english' }
                           }

  has_many :course_editions
  monetize :price_cents

  has_one_attached :thumbnail

  def sold_count
    result = 0
    course_editions.each do |edition|
      result += edition.order_items.size
    end
    result
  end
end
