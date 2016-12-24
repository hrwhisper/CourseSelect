class CreateCoursesSemesters < ActiveRecord::Migration
  def change
    create_table :courses_semesters, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :semester, index: true
    end
  end
end
