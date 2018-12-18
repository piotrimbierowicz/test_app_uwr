ce = CourseEdition.find(176)

ce.update(quantity: 1)

4.times do
  fork do
    guest = Guest.create!
    AddToCart.run!(guest: guest, course_edition: ce)
    ConfirmCart.run!(cart: guest.cart)
  end
end
Process.waitall

ce.reload.quantity
