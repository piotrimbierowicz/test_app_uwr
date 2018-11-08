class CreateCourseEditions < ActiveRecord::Migration[5.2]
  def change
    create_table :course_editions do |t|
      t.integer :course_id
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
