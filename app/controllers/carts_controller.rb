class CartsController < ApplicationController
  def index
    @cart = current_guest.cart
  end

  def confirm
    outcome = ConfirmCart.run(cart: current_guest.cart)

    flash[:notice] = if outcome.valid?
                       'OK'
                     else
                       'Błąd'
                     end

    redirect_to user_panel_order_path(cart)
  end
end
