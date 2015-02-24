class UsersController < ApplicationController
  before_filter :is_user?, except: :new
  def new 
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    
    if @user.save
      #redirect_to @user
      redirect_to root_url, notice: "Thank you for signing up"
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])   
  end
  def index
    @users = User.all
  end
end

private
def user_params
  params.require(:user).permit(:name, :login, :password, :email, :password_confirmation, :role)
  end