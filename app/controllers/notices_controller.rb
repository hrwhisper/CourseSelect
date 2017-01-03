class NoticesController < ApplicationController
  def show
    @notice = Notice.find_by_id(params[:id])
  end

  def index
    @notice = Notice.order(created_at: :desc)
  end
end