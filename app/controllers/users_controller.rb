class UsersController < ApplicationController
<<<<<<< HEAD

  before_action :if_admin
=======
  #before_filter :is_user?, except: :new
  
>>>>>>> 84a4522e729e2e5dc8ac21d43017fa0e1d703360
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
  
<<<<<<< HEAD
  def edit
     @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
=======
  def create
    @user = User.new(user_params)
    if @user.save
      #redirect_to @user
>>>>>>> 84a4522e729e2e5dc8ac21d43017fa0e1d703360
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

<<<<<<< HEAD
=======
  def edit
    
  end
  
>>>>>>> 84a4522e729e2e5dc8ac21d43017fa0e1d703360
  def destroy
  
  end

end

private
def user_params
  params.require(:user).permit(:name, :login, :password, :email, :password_confirmation, :role)
end