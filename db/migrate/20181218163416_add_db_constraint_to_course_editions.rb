class AddDbConstraintToCourseEditions < ActiveRecord::Migration[5.2]
  def up
  	execute <<-SQL
  	  alter table course_editions
  	    add constraint quantity_check
  	      check (quantity >= 0);
  	SQL
  end

  def down
  	execute <<-SQL
  	  alter table course_editions
  	    drop constraint quantity_check;
  	SQL
  end
end
