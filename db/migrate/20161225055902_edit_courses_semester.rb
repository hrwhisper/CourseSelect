class EditCoursesSemester < ActiveRecord::Migration
  def change
    drop_table :courses_semesters
    drop_table :semesters
    add_column :courses, :year, :integer
    add_column :courses, :term_num, :integer, :default => 1
  end
end
