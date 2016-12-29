class GradesController < ApplicationController

  before_action :teacher_logged_in, only: [:update, :export]

  def update
    @grade=Grade.find_by_id(params[:id])
    if @grade.update_attributes!(:grade => params[:grade][:grade])
      flash={:success => "#{@grade.user.name} #{@grade.course.name}的成绩已成功修改为 #{@grade.grade}"}
    else
      flash={:danger => "上传失败.请重试"}
    end
    redirect_to grades_path(course_id: params[:course_id]), flash: flash
  end

  def index
    if teacher_logged_in?
      @course=Course.find_by_id(params[:course_id])
      @grades=@course.grades
    elsif student_logged_in?
      @grades=current_user.grades
    else
      redirect_to root_path, flash: {:warning => "请先登陆"}
    end
  end

  def export
    course = Course.find_by_id(params[:course_id])
    respond_to do |format|
      format.xls {
        require 'tempfile'
        temp_file = Tempfile.new("#{current_user.id.to_s+'_'+course.name}.xls")

        workbook = Spreadsheet::Workbook.new
        worksheet = workbook.create_worksheet
        worksheet.row(0).concat %w{学号 姓名 专业 培养单位 邮箱 成绩}
        course.grades.each_with_index do |grade, i|
          worksheet.row(i+1).push grade.user.num, grade.user.name, grade.user.major, grade.user.department, grade.user.email, grade.grade
        end
        workbook.write temp_file
        send_file temp_file, :type => "application/vnd.ms-excel", :filename => "#{course.name}.xls", :stream => false
        # temp_file.rewind
      }
    end
  end

  private

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end
end