class SessionsController < ApplicationController

  def new
  end

  def create
    key = Rails.env.development? ? :login : :email
    hash = {key => params[key]}

    user = User.find_by(hash)

  	if user && (Rails.env.development? || user.authenticate(params[:password]))
  		session[:user_id] = user.id
  		redirect_to root_url, notice: "Logged in"
  	else
  		flash[:alert] = "Email or password is invalid"
  		render "new"
  	end

  end
  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "logged off"
  end

end
