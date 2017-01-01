class HomesController < ApplicationController
  include CoursesHelper

  def index
    @course_to_choose=Course.where('open = true') # -current_user.courses
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
    @notice = Notice.all
  end

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

end
