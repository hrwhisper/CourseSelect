class DiscussionsController < ApplicationController

    def index
        if teacher_logged_in?
          @course=Course.find_by_id(params[:course_id])
          @discuss=@course.discussions
        elsif student_logged_in?
          @discuss=current_user.discussions
        else
          redirect_to root_path, flash: {:warning=>"请先登陆"}
        end
    end
    
    def edit
      @discuss=Discussion.find_by_id(params[:id])
    end
    
    def update
      @discuss=Discussion.find_by_id(params[:id])
      if @discuss.update_attributes(discussion_params)
        if @discuss.save
          flash={:info => "#{@discuss.course.name}发言成功"}
        else
          flash={:info => "请重新提交#{@discuss.course.name}的发言"}
        end
      else
        flash={:warning => "更新失败"}
      end
      redirect_to discussions_path, flash: flash
    end
    
    def list
      @course=Course.find_by_id(params[:course_id])
      @discuss=@course.discussions
    end
    
    def discussion_params
    params.require(:discussion).permit(:content)
    end
  
end
