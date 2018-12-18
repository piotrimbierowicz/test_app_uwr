class CartsController < ApplicationController
  def index
    @cart = current_guest.cart
  end

  def confirm
    outcome = ConfirmCart.run(cart: current_guest.cart)

   	if outcome.valid?
      flash[:notice] = 'OK'
    	redirect_to user_panel_order_path(cart)
    else
      flash[:notice] = 'Błąd'
      redirect_to user_panel_order_path(cart)
    end

  end
end
