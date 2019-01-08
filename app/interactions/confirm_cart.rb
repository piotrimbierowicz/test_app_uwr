class ConfirmCart < ActiveInteraction::Base
  object :cart, class: Order

  validate :items_available

  def execute
    ActiveRecord::Base.transaction do
      update_status
      update_quantity
    end
  end

  def update_status
    cart.update status: Order::PENDING_ORDER_STATUS
  end

  def update_quantity
    cart.order_items.each do |item|
      edition = item.course_edition
      CourseEdition.where(id: edition.id).update_all('quantity = quantity - 1')
    end
  end

  def items_available
    errors.add(:base, 'is not availale') if cart.order_items.any? { |item| item.course_edition.quantity.zero? }
  end
end
