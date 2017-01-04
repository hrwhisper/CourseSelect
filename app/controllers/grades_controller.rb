class GradesController < ApplicationController
  include CoursesHelper

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

  def stastics
    @grades = []
    @courses= get_student_course()
    @all_semester= get_course_info(@courses, 'year', 'term_num')
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
      current_user.grades.each do|grade|
        if grade.course.year == semester[0] and grade.course.term_num == semester[1]
          @grades << grade
        end
      end
    else
      @current_semester = nil
      @grades = current_user.grades
    end
    @total_score = 0
    @total_credit= 0
    @means_core = 0
    if !(@grades.nil?)
      @grade_level = {"优" => 0, "良" => 0, "中" => 0, "及格" => 0, "不及格" => 0}
      @grades.each do |grade|
        if !(grade.grade.nil?)
          @credits = grade.course.credit.split('/')
          @total_score+=grade.grade * @credits[1].to_i
          @total_credit+=@credits[1].to_f
          if grade.grade <60
            @grade_level["不及格"]+=1
          elsif grade.grade <70
            @grade_level["及格"]+=1
          elsif grade.grade <80
            @grade_level["中"]+=1
          elsif grade.grade <90
            @grade_level["良"]+=1
          else
            @grade_level["优"]+=1
          end
        end
      end
    end
  end


  def import
    file = params[:excel_file]
    course_id = params[:course_id]
    flash = {}
    if file and file.original_filename.split('.')[-1] == 'xls'
      book = Spreadsheet.open file.path
      error_student = []
      worksheet = book.worksheet 0
      worksheet.each_with_index do |row, i|
        if i != 0
          cur_student = User.find_by_num(row[0]) # row[0] is the student_num
          if not cur_student
            error_student << i + 1
            next
          end
          grade = Grade.where('course_id = ? and user_id=?', course_id, cur_student.id).take
          if not row[-1] or row[-1] < 0 or row[-1] > 100 or not grade or (not grade.update(grade: row[-1]))
            error_student << i + 1
          end
        end
      end
      flash[:success] = "上传成功,共有#{worksheet.last_row_index}个学生, #{worksheet.last_row_index - error_student.length}个学生成绩已更新"
      if error_student.length !=0
        flash[:warning] = "行号为 #{error_student.join(' , ')} 的学生更新失败，请检查学号以及分数的合法性"
      end
    else
      flash[:danger] = '文件格式错误'
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