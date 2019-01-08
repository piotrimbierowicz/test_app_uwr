class AddLockVersionToCourseEditions < ActiveRecord::Migration[5.2]
  def change
    add_column :course_editions, :lock_version, :integer, default: 1
  end
end
