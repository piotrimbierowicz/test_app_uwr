class CoursesController < ApplicationController
  helper_method :sorting

  def index
    @courses = CoursesProvider.new(params[:key]).results
    apply_sorting
    @courses = @courses.page(params[:page]).per(9)
  end

  def sorting
    params[:sort_by] || cookies[:courses_sorting]
  end

  private

  def apply_sorting
    cookies[:courses_sorting] = sorting

  	if sorting.in? ['created_at desc', 'created_at asc']
  		@courses = @courses.reorder(sorting)
    elsif sorting.in? ['popular desc', 'popular asc'] 	
      order = sorting.split(' ').last
      @courses = @courses.left_joins(course_editions: :order_items)
                         .group(:course_id, :id)
                         .reorder("count(*) #{order}")
    end
  
  end
end
