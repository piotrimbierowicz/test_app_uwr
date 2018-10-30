class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

  validates_presence_of :content

  scope :visible, -> { where(hidden: false) }
end
