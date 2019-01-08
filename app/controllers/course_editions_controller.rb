class CourseEditionsController < ApplicationController
  def add_to_cart
    edition = CourseEdition.find(params[:id])
    outcome = AddToCart.run(guest: current_guest, course_edition: edition)

    flash[:notice] = if outcome.valid?
                       'Dodano do koszyka'
                     else
                       outcome.errors.full_messages
                     end

    redirect_to courses_path
  end
end
