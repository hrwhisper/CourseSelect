class CoursesController < ApplicationController
  include CoursesHelper
  before_action :student_logged_in, only: [:select, :quit]
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update, :student_list]
  before_action :logged_in, only: [:index, :my_course_list]

  #-------------------------for teachers----------------------

  def new
    @course=Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      current_user.teaching_courses<<@course
      redirect_to courses_path, flash: {success: "新课程申请成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @course=Course.find_by_id(params[:id])
    # @semester = @course.semester # semester_format(@course.semesters[0])
  end

  def update
    @course = Course.find_by_id(params[:id])
    puts('--------')

    if @course.update_attributes(course_params)
      flash={:success => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to courses_path, flash: flash
  end

  def destroy
    @course=Course.find_by_id(params[:id])
    current_user.teaching_courses.delete(@course)
    @course.destroy
    flash={:success => "成功删除课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def open
    @course = Course.find_by_id(params[:id])
    @course.open = true
    if @course.save
      flash={:success => "已经成功关闭该课程:#{ @course.name}"}
    else
      flash={:warning => "开启失败"}
    end
    redirect_to courses_path, flash: flash
  end

  def close
    @course = Course.find_by_id(params[:id])
    @course.open = false
    if @course.save
      flash={:success => "已经成功关闭该课程:#{ @course.name}"}
    else
      flash={:warning => "关闭失败"}
    end
    redirect_to courses_path, flash: flash
  end


  def student_list
    @course = Course.find_by_id(params[:id])
    @user = @course.users
    @user_department = {}
    @user.each do |user|
      if !@user_department.has_key?(user.department)
        @user_department[user.department] =0
      end
      @user_department[user.department] += 1
    end
  end

  #-------------------------for students----------------------

  def list # course to select list
    @in_course_select_time = in_course_select_time?()
    if @in_course_select_time # 选课时间判断
      @course_to_choose=get_course_to_choose_list()
      @current_semester = get_current_semester()

      @course = get_current_semester_course()
      @course_time_table = get_course_table(@course)

      @course_time = get_course_info(@course_to_choose, 'course_time')
      @course_exam_type = get_course_info(@course_to_choose, 'exam_type')
      # @course_teacher = get_course_info(@course_to_choose, 'teacher')
      if request.post?
        @course_to_choose=course_filter_by_condition(@course_to_choose, params, ['course_time', 'exam_type'])
      end
    end
  end


  def select
    @in_course_select_time = in_course_select_time?()
    flash = nil
    if @in_course_select_time # 选课时间判断
      ids = params[:course_to_choose]
      if ids
        @course = Course.find(ids)
        if course_conflict?(get_current_semester_course(), @course)
          flash={:warning => "课程冲突"}
        else
          fails_course = []
          success_course = []
          @course.each do |course|
            if course.grades.length < course.limit_num and Grade.create(:user_id => current_user.id, :course_id => course.id)
              success_course << course.name
            else
              fails_course << course.name
            end
          end
          if success_course.length !=0
            flash = {:success => ("成功选择课程:  " + success_course.join(','))}
          end
          if fails_course.length !=0
            waring_info = fails_course.join(',') +'  人数已满'
            if flash != nil
              flash[:warning] = waring_info
            else
              flash = {:warning => waring_info}
            end
          end
        end
      else
        flash={:success => "请勾选课程"}
      end
    else
      flash={:warning => "不在选课时间！"}
    end
    redirect_to courses_path, flash: flash
  end


  def quit
    @course=Course.find_by_id(params[:id])
    Grade.where(:user_id => current_user.id, :course_id => @course.id).take.destroy()
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end


  #-------------------------for both teachers and students----------------------

  def edit_outline
    @course=Course.find_by_id(params[:id])
    # @semester = @course.semester # semester_format(@course.semesters[0])
  end

  def course_outline
    puts("this is course_outline")
    @course = Course.find_by_id(params[:id])
    @coursetmp = current_user.teaching_courses if teacher_logged_in?
  end


  def save_discuss
    @course = Course.find_by_id(params[:id])
    if @course.diss="暂无人发言"
      @course.diss=""
    end
    if @course.tmp!=nil
      @course.diss+="匿名用户："
      @course.diss+=@course.tmp
    end

    if @course.save
      flash={:success => "已经成功保存在《#{@course.name}》中的发言:#{ @course.tmp}"}
    else
      flash={:warning => "保存失败"}
    end

    redirect_to courses_path, flash: flash
  end


  def course_discuss
    @course = Course.find_by_id(params[:id])
    @test=""
  end


  def index
    redirect_to '/courses/my_course_list'
  end

  def my_course_list
    @course=current_user.teaching_courses if teacher_logged_in?
    @course= get_student_course() if student_logged_in?
    @all_semester= get_course_info(@course, 'year', 'term_num')
    @current_semester = get_current_semester()
    semester = nil
    if request.post?
      if params[:semester] !=''
        @current_semester = params[:semester]
        semester = semester_to_array(@current_semester)
      end
    else
      semester = semester_to_array(@current_semester)
    end
    if semester
      @course= filter_course_by_semester(@course, semester)
    else
      @current_semester = nil
    end
    @course_time_table = get_course_table(@course)

  end

  private
  # Confirms a student logged-in user.
  def student_logged_in
    unless student_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a  logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  def course_params
    params.require(:course).permit(:course_code, :name, :course_type, :teaching_type, :exam_type,
                                   :credit, :limit_num, :class_room, :course_time, :course_week,
                                   :tmp, :outline, :diss, :discussion, :discussions, :discuss,
                                   :discussess, :year, :term_num)
  end
end