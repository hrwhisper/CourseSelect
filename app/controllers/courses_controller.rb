class CoursesController < ApplicationController
  include CoursesHelper
  before_action :student_logged_in, only: [:select, :quit, :list]
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update, :student_list]
  before_action :logged_in, only: :index

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
      flash={:info => "更新成功"}
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

  def list
    @course_to_choose=Course.where('open = true')-current_user.courses
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
    @course_time_table = get_current_curriculum_table(@course)

    @course_time = get_course_info(@course_to_choose, 'course_time')
    @course_exam_type = get_course_info(@course_to_choose, 'exam_type')
    # @course_teacher = get_course_info(@course_to_choose, 'teacher')
    if request.post?
      res = []
      @course_to_choose.each do |course|
        if check_course_condition(course, 'course_time', params['course_time']) and
            check_course_condition(course, 'exam_type', params['exam_type'])
          res << course
        end
        @course_to_choose=res
      end
    end
  end


  def choose_course
    ids = params[:course_to_choose]
    # todo check ids is nil
    # todo 检查课程冲突
    @course = Course.find(ids)
    current_user.courses<<@course
    flash={:success => "成功选择课程"}
    redirect_to courses_path, flash: flash
  end

  def select
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    flash={:suceess => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by_id(params[:id])
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end


  #-------------------------for both teachers and students----------------------

  def index
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
    @course_time_table = get_current_curriculum_table(@course)
  end

  def curriculum
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
    render :json => @course
  end

  def course_outline
    @course = Course.find_by_id(params[:id])
    @coursetmp=current_user.teaching_courses if teacher_logged_in?
  end


  def course_discuss
    @course = Course.find_by_id(params[:id])
    @discuss = @course.discussions
    if @course.diss=="暂无人发言"
      @course.diss="匿名用户："
    end
    if @course.tmp!=nil
      @course.diss += @course.tmp
    end
    #@course.diss = @course.diss + "匿名用户"
    #@course.diss = @course.diss + @course.tmp
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
                                   :credit, :limit_num, :class_room, :course_time, :course_week, :tmp, :outline, :diss, :discussion, :discussions, :discuss, :discussess)
  end
end
