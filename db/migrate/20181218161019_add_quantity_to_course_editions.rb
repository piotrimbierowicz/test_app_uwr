class AddQuantityToCourseEditions < ActiveRecord::Migration[5.2]
  def change
    add_column :course_editions, :quantity, :integer, default: 0
  end
end
