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
          flash={:info => "#{@comment.course.name}已评估"}
        else
          flash={:warning => "更新失败"}
        end
        redirect_to comments_path, flash: flash

    end
    
    def list
      @course=Course.find_by_id(params[:course_id])
      @comments=@course.comments
      @count=0
       @comment_1_score = 0 
        @comment_2_score = 0
        @comment_3_score = 0
        @comment_4_score = 0
        @comment_5_score = 0
        @comment_6_score = 0
        @comment_7_score = 0
        @comment_8_score = 0
        @comment_9_score = 0
        @comment_10_score = 0
        @comment_11_score = 0
        @comment_12_score = 0
        @comment_13_score = 0
        @comment_14_score = 0
        @comment_15_score = 0
        @comment_16_score = 0
        @comment_17_score = 0
      @comments.each do |comment|
        if !(comment.comment_1.nil?) then
          @count+=1
          @comment_1_score += comment.comment_1
          @comment_2_score += comment.comment_2
          @comment_3_score += comment.comment_3
          @comment_4_score += comment.comment_4
          @comment_5_score += comment.comment_5
          @comment_6_score += comment.comment_6
          @comment_7_score += comment.comment_7
          @comment_8_score += comment.comment_8
          @comment_9_score += comment.comment_9
          @comment_10_score += comment.comment_10
          @comment_11_score += comment.comment_11
          @comment_12_score += comment.comment_12
          @comment_13_score += comment.comment_13
          @comment_14_score += comment.comment_14
          @comment_15_score += comment.comment_15
          @comment_16_score += comment.comment_16
          @comment_17_score += comment.comment_17
        end
      end
      if @count!=0 then
      @comment_1_score/=@count
      @comment_2_score/=@count
      @comment_3_score/=@count
      @comment_4_score/=@count
      @comment_5_score/=@count
      @comment_6_score/=@count
      @comment_7_score/=@count
      @comment_8_score/=@count
      @comment_9_score/=@count
      @comment_10_score/=@count
      @comment_11_score/=@count
      @comment_12_score/=@count
      @comment_13_score/=@count
      @comment_14_score/=@count
      @comment_15_score/=@count
      @comment_16_score/=@count
      @comment_17_score/=@count
      end
    end
    
    def comment_params
    params.require(:comment).permit(:comment_1, :comment_2, :comment_3, :comment_4, :comment_5,:comment_6, :comment_7, :comment_8, :comment_9, :comment_10, :comment_11,:comment_12,:comment_13,:comment_14,:comment_15,:comment_16,:comment_17)
    end
    
end
