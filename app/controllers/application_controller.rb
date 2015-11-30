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
    redirect_to root_url, alert: "Not admin" if current_user.nil? || current_user.role != 1
  end

  def if_current_user
    ids = current_user.id.to_s + " | " + params[:id]
    redirect_to root_url, alert: "User have no permissons #{ids}" if current_user.id!=(params[:id])
  end
  
  def admin?
    !current_user.nil? && User.find(session[:user_id]).role == 1
  end
  helper_method :admin?

  rescue_from ActiveRecord::RecordNotFound, :with => :error_not_found
  rescue_from AbstractController::ActionNotFound, :with => :error_not_found
  rescue_from ActionView::MissingTemplate, :with => :error_not_found

  def error_not_found
  render :status => 404, :template => 'errors/not_found', :layout => 'errors'
  end
  
  
end
