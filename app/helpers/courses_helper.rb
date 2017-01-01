require 'set'

module CoursesHelper
  def week_data_to_num(week_data)
    param = {
        '周一' => 0,
        '周二' => 1,
        '周三' => 2,
        '周四' => 3,
        '周五' => 4,
        '周六' => 5,
        '周天' => 6,
    }
    param[week_data] + 1
  end

  # def get_course_list()
  #   @course_to_choose=Course.where('open = true')-current_user.courses
  #   @course=current_user.teaching_courses if teacher_logged_in?
  #   @course=current_user.courses if student_logged_in?
  #   @course_time = get_current_curriculum_table(@course)
  # end

  def get_current_curriculum_table(courses)
    course_time = Array.new(11) { Array.new(7, '') }
    courses.each do |cur|
      cur_time = String(cur.course_time)
      end_j = cur_time.index('(')
      j = week_data_to_num(cur_time[0...end_j])
      t = cur_time[end_j + 1...cur_time.index(')')].split("-")
      for i in (t[0].to_i..t[1].to_i).each
        course_time[(i-1)*7/7][j-1] = cur.name
      end
    end
    course_time
  end

  def get_course_info(courses, type)
    res = Set.new
    courses.each do |course|
      res.add(course[type])
    end
    res.to_a.sort
  end

  def check_course_condition(course, key, value)
    if value == '' or course[key] == value
      return true
    end
    false
  end

  def semester_format(semester)
    year = semester.year
    num = semester.num
    "#{year}年第(#{num})学期"
  end
end