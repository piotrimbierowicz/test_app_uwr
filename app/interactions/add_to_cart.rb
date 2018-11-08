class AddToCart < ActiveInteraction::Base
  object :guest
  object :course_edition

  def execute
    guest.cart.order_items.create course_edition: course_edition
  end
end
