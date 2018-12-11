require 'open-uri'

# 50.times do
#   # create Course
#   course = Course.create!(
#     name: Faker::Book.title,
#     description: Faker::Lorem.paragraphs(5).join("\n"),
#     price: Faker::Commerce.price
#   )
#
#   # attach thumbnail
#   image_path = 'http://lorempixel.com/600/400/city/'
#   file = open(URI.parse(image_path))
#   course.thumbnail.attach(io: file, filename: 'thumbnail.jpg', content_type: 'image/jpg')
#
#   # create CourseEditions
#   [1,2,4].sample.times do |i|
#     start_time = (i+2).months.from_now
#     CourseEdition.create!(
#       course: course,
#       starts_on: start_time,
#       ends_on: start_time + 7.days
#     )
#   end
# end
