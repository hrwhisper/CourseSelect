class DiscussionsController < ApplicationController

  def update
    @discussion=Discussion.find_by_id(params[:id])
    if @discussion.update_attributes!(:content => params[:content][:content])
      flash={:success => "#{@discussion.user} 的发言为 #{@discussion.content}"}
      @discusstmp<< @discussion
    else
      flash={:danger => "上传失败.请重试"}
    end
    # redirect_to back
    redirect_to discussion_path(course_id: params[:course_id]), flash: flash
  end
  
  
  def index
    @course = Course.find_by_id(params[:course_id])
    @discuss = @course.discussions
    @discusstmp=Discussion.new
    if @discuss==nil
      @discuss=@discusstmp
    end
  end
  
  def show
   @course = Course.find_by_id(params[:course_id])
   @discusstmp = @course.discussions
   if @discuss==nil
     @discuss=@discusstmp
   end
  end
  
end
