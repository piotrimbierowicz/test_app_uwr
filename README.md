# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


rails g model guest
rake db:migrate
binding.pry
rails g model course name:string description:text
rails g model course_edition course_id:integer starts_on:date ends_on:date
rails g model order owner_id:integer owner_type:string status:string
rake db:rollback
rails g money_rails:initializer

class Product < ActiveRecord::Base

  monetize :price_cents

end

reload!

Course.last.price.to_s
CourseEdition course_id: Course.last.id starts_on: Date.today + 7.days, ends_on: Date.today+14.days

git commit -m 'WIP' 

index w bazie