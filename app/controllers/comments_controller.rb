class CommentsController < ApplicationController
    
    def index
        if teacher_logged_in?
          @course=Course.find_by_id(params[:course_id])
          @comments=@course.comments
        elsif student_logged_in?
          @comments=current_user.comments
        else
          redirect_to root_path, flash: {:warning=>"请先登陆"}
        end
    end
    
end
