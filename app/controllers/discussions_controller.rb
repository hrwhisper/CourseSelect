class DiscussionsController < ApplicationController


    def new
          @discussion=Discussion.new
    end

    def index
          @course=Course.find_by_id(params[:course_id])
          @discussion=@course.discussions
    end
    
    def show
          @course=Course.find_by_id(params[:course_id])
          @discussion=@course.discussions
    end
    
    def edit
          @course=Course.find_by_id(params[:course_id])
          @discussion=@course.discussions
    end
    
    def create
        @course=Course.find_by_id(params[:course_id])
        @discussion=@course.discussions
        @tmp=Discussion.new
        @tmp.user="匿名用户"
        @tmp.content=params[:@discussion][:content]
        if @discussion == nil
          @discussion=@tmp
        else
          @discussion<<@tmp
        end
        #if @discuss.update_attributes(discussion_params)
        if @course.save
          flash={:success => "已经成功保存在《#{@course.name}》中的发言:#{ params[:@discussion][:content]}"}
        else
          flash={:warning => "更新失败"}
        end
      redirect_to discussions_path(course_id:params[:course_id]), flash: flash
    end
  
    def update
        @course=Course.find_by_id(params[:course_id])
        @discussion=@course.discussions
        @tmp=Discussion.new
        @tmp.user="匿名用户"
        @tmp.content=params[:content]
        if @discussion == nil
          @discussion=@tmp
        else
          @discussion+=@tmp
        end
        #if @discuss.update_attributes(discussion_params)
      #  flash={:info => "#{@discuss.course.name}发言成功"}
        if @discussion.save
          flash={:info => "#{@discuss.course.name}发言成功"}
        else
          flash={:warning => "更新失败"}
        end
      redirect_to discussions_path, flash: flash
    end
    
    def list
      @course=Course.find_by_id(params[:course_id])
      @discuss=@course.discussions
    end
  
end
