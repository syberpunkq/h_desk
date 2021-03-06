class UsersController < ApplicationController


  before_action :if_user
  before_action :if_admin, only: [:index, :destroy]
  before_action :if_current_user, only: [:show, :edit, :update]
  #index, show, new, edit, create, update и destroy isnecud
    
  def index
    @users = User.all
  end
    
  def show
    @user = User.find(params[:id])   
  end

  def new 
    @user = User.new
  end
  
  def edit
     @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up"
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])  
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end


  def destroy
  
  end

end

private
def user_params
  params.require(:user).permit(:name, :login, :password, :email, :password_confirmation, :role)
end