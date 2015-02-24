class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def is_user?
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
  def is_admin?
    redirect_to root_url, alert: "Not admin" if current_user.role != 0
  end
  
end
