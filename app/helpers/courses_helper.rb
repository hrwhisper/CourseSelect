require 'set'

module CoursesHelper
  def semester_to_season(semester) # '2016-1'
    if semester.nil?
      return nil
    end
    semester = semester.split('-')
    if semester[1] == '1'
      semester[1] = '秋季学期'
    elsif semester[1] == '2'
      semester[1] = '春季学期'
    else
      semester[1] = '夏季学期'
    end
    semester[0] += '-' +(semester[0].to_i + 1).to_s
    semester.join('学年')
  end


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


  def get_course_table(courses)
    course_time = Array.new(11) { Array.new(7, {'name' => '', 'id' => ''}) }
    if courses
      courses.each do |cur|
        cur_time = String(cur.course_time)
        end_j = cur_time.index('(')
        j = week_data_to_num(cur_time[0...end_j])
        t = cur_time[end_j + 1...cur_time.index(')')].split("-")
        for i in (t[0].to_i..t[1].to_i).each
          course_time[(i-1)*7/7][j-1] = {
              'name' => cur.name,
              'id' => cur.id
          }
        end
      end
    end
    course_time
  end

  def course_conflict?(current_courses, to_select_courses)
    current_course_table = get_course_table(current_courses)
    to_choose_table = get_course_table(to_select_courses)
    for i in (0...current_course_table.length)
      for j in (0...current_course_table[i].length)
        if current_course_table[i][j]['id'] != '' and to_choose_table[i][j]['id'] != ''
          return true
        end
      end
    end
    false
  end

  def get_course_info(courses, type, type2=nil)
    res = Set.new
    courses.each do |course|
      if type2
        res.add(course[type].to_s+'-'+course[type2].to_s)
      else
        res.add(course[type])
      end
    end
    res.to_a.sort
  end

  def get_student_course()
    course = []
    current_user.grades.each do |x|
      course << x.course
    end
    course
  end

  def get_current_semester()
    current_semester = Systeminfo.where(name: 'current_semester').take
    current_semester[:value]
  end

  def semester_to_array(current_semester)
    current_semester = current_semester.split('-')
    current_semester[0], current_semester[1] = current_semester[0].to_i, current_semester[1].to_i
    current_semester
  end

  def filter_course_by_semester(course, semester=nil)
    if semester == nil
      semester = semester_to_array(get_current_semester())
    end
    condition = {
        'year' => semester[0],
        'term_num' => semester[1]
    }
    course_filter_by_condition(course, condition, ['year', 'term_num'])
  end

  def get_current_semester_course()
    logged_in? ? filter_course_by_semester(get_student_course()) : nil
  end

  def course_filter_by_condition(courses, params, keys)
    if params == nil
      return courses
    end
    res = []
    courses.each do |course|
      ok = true
      keys.each do |key|
        if not (params[key] == '' or course[key] == params[key])
          ok = false
          break
        end
      end
      if ok
        res << course
      end
    end
    res
  end

  def get_course_to_choose_list()
    current_semester = semester_to_array(get_current_semester())
    course = Course.where('open = true and year=? and term_num =?',
                          current_semester[0], current_semester[1])
    logged_in? ? course- get_student_course() : course
  end

  def get_course_select_end_time()
    end_time = Systeminfo.where(name: 'course_select_end_time').take
    Time.new(*end_time[:value].split('-'))
  end

  def in_course_select_time?()
    cur_time = Time.now
    course_select_time = get_course_select_end_time()
    in_course_select_time = cur_time <= course_select_time
  end


  def semester_format(semester)
    year = semester.year
    num = semester.num
    "#{year}年第(#{num})学期"
  end
end