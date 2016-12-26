class Course < ActiveRecord::Base

  has_many :grades
  has_many :users, through: :grades
  has_many :discussions
  has_many :comments
  belongs_to :teacher, class_name: 'User'

  validates :name, :course_type, :course_time, :course_week,
            :class_room, :credit, :teaching_type, :exam_type, presence: true, length: {maximum: 50}

  def semester_attributes=(attributes)
    # Process the attributes hash
  end

end
