class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
  
  def if_user
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
  def if_admin
    redirect_to root_url, alert: "Not admin" if current_user.role != 1
  end
  
  def is_admin?
    User.find(session[:user_id]).role == 1
  end
  helper_method :is_admin?

  
  
  
end
