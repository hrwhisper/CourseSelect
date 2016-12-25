class CoursesSemester < ActiveRecord::Base
  belongs_to :course
  belongs_to :semester
  accepts_nested_attributes_for :semester
  accepts_nested_attributes_for :course
end