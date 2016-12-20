class RemoveStudentNum < ActiveRecord::Migration
  def change
    remove_column :courses, :student_num
  end
end
