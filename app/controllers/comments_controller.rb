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
    
    def edit
      @comment=Comment.find_by_id(params[:id])
    end
    
    def update
       @comment = Comment.find_by_id(params[:id])
      if @comment.update_attributes(comment_params)
        flash={:info => "#{@comment.course.name}的成绩已评估"}
      else
        flash={:warning => "更新失败"}
      end
      redirect_to comments_path, flash: flash
    end
    
    def show
      @comment=Comment.find_by_id(params[:id])
    end
    
    def comment_params
    params.require(:comment).permit(:comment_1, :comment_2, :comment_3, :comment_4, :comment_5,:comment_6, :comment_7, :comment_8, :comment_9, :comment_10, :comment_11,:comment_12,:comment_13,:comment_14,:comment_15,:comment_16,:comment_17)
    end
    
end
