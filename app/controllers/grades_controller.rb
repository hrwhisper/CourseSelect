class GradesController < ApplicationController

  before_action :teacher_logged_in, only: [:update, :export, :import]

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


  def import
    file = params[:excel_file]
    course_id = params[:course_id]
    flash = {}
    if file.original_filename.split('.')[-1] == 'xls'
      book = Spreadsheet.open file.path
      error_student = []
      worksheet = book.worksheet 0
      worksheet.each_with_index do |row, i|
        if i != 0
          cur_student = User.find_by_num(row[0]) # row[0] is the student_num
          if not cur_student
            error_student << row[0]
            next
          end
          grade = Grade.where('course_id = ? and user_id=?', course_id, cur_student.id).take
          if not row[-1] or row[-1] < 0 or row[-1] > 100 or not grade or (not grade.update(grade: row[-1]))
            error_student << row[0]
          end
        end
      end
      flash[:success] = "上传成功,共有#{worksheet.last_row_index}个学生, #{worksheet.last_row_index - error_student.length}个学生成绩已更新"
      if error_student.length !=0
        flash[:error] = "学号为 #{error_student.join(' , ')} 更新失败，请检查学号以及分数的合法性"
      end
    else
      flash[:error] = '文件格式错误'
    end
    redirect_to grades_path(course_id: course_id), flash: flash
  end

  private

# Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

end