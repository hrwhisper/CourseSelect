class NoticesController < ApplicationController
  def show
    @notice = Notice.find_by_id(params[:id])
  end
end