class Semester < ActiveRecord::Base
  has_many :courses_semester
  has_many :courses, through: :courses_semester
  accepts_nested_attributes_for :courses
end