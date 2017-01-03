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
        if params[:@discussion][:content] != ""
         @tmp=Discussion.new
         @tmp.user="匿名用户"
         @tmp.content=params[:@discussion][:content]
         if @discussion == nil
           @discussion=@tmp
         else
           @discussion<<@tmp
         end
         
          if @course.save
            flash={:success => "已经成功保存在《#{@course.name}》中的发言:#{ params[:@discussion][:content]}"}
          else
            flash={:warning => "更新失败"}
          end
        else
          flash={:warning => "发言内容不能为空！"}
        end
       redirect_to discussions_path(course_id:params[:course_id]), flash: flash
    end
  
    def update
        @course=Course.find_by_id(params[:course_id])
        @discussion=@course.discussions
    end
    
    def list
      @course=Course.find_by_id(params[:course_id])
      @discuss=@course.discussions
    end
  
end
