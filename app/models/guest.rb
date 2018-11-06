class Guest < ApplicationRecord
  has_many :orders, as: :owner

  def cart
    if orders.any?
      orders.first
    else
      Order.create owner: self
      # 2 sposób guest.orders.create
    end
  end
end
