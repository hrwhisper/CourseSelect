class HomesController < ApplicationController
  include CoursesHelper

  def index
    @notice = Notice.order(created_at: :desc).limit(5)
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
