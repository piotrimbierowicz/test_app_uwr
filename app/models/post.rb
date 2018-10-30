class Post < ApplicationRecord
  belongs_to :author
  has_many :comments

  validates_presence_of :title
  validates_presence_of :content

  has_one_attached :thumbnail
end
