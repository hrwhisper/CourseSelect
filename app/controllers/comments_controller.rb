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
        @comment.commented = true
        if @comment.save
          flash={:success => "#{@comment.course.name}已评估"}
        else
          flash={:info => "请重新提交#{@comment.course.name}的评估"}
        end
      else
        flash={:warning => "更新失败"}
      end
      redirect_to comments_path, flash: flash
    end
    
    def list
      @course=Course.find_by_id(params[:course_id])
      @comments=@course.comments
      @comments_score = Array[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @count=0
      @comments.each do |comment|
        if !(comment.comment_1.nil?) then
          @count+=1
          @comments_score[0] += comment.comment_1
          @comments_score[1] += comment.comment_2
          @comments_score[2] += comment.comment_3
          @comments_score[3] += comment.comment_4
          @comments_score[4] += comment.comment_5
          @comments_score[5] += comment.comment_6
          @comments_score[6] += comment.comment_7
          @comments_score[7] += comment.comment_8
          @comments_score[8] += comment.comment_9
          @comments_score[9] += comment.comment_10
          @comments_score[10] += comment.comment_11
          @comments_score[11] += comment.comment_12
          @comments_score[12] += comment.comment_13
          @comments_score[13] += comment.comment_14
          @comments_score[14] += comment.comment_15
          @comments_score[15] += comment.comment_16
          @comments_score[16] += comment.comment_17
        end
      end
      if @count!=0 then
        @i = 0
        while @i < 17 do
            @comments_score[@i] /= @count
            @i+=1
        end
      end
      
      #评教信息图表
      if @count != 0 then
        @comment_level = {"优"=>0,"良"=>0,"中"=>0}
        @comments_score.each do |comment|
          if comment < 80
            @comment_level["中"]+=1
          elsif comment<90
            @comment_level["良"]+=1
          else
            @comment_level["优"]+=1
          end
        end
      end
      
    end
    
    def comment_params
    params.require(:comment).permit(:comment_1, :comment_2, :comment_3, :comment_4, :comment_5,:comment_6, :comment_7, :comment_8, :comment_9, :comment_10, :comment_11,:comment_12,:comment_13,:comment_14,:comment_15,:comment_16,:comment_17,:Commenttext)
    end
    
end
