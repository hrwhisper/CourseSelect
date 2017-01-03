class SessionsController < ApplicationController
  include SessionsHelper

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    flash = nil
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember_user(user) : forget_user(user)
    else
      flash= {:danger => '账号或密码错误'}
    end
    redirect_to root_url, :flash => flash
  end

  def new

  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
