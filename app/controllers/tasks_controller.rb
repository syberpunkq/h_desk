class TasksController < ApplicationController
  
  #http_basic_authenticate_with name: "admin", password: "111", except: [:index, :show]
  before_filter :is_user?#, only: [:edit, :update]
  #before_filter :is_admin?, only: [:edit, :update]
  
  def index
    @tasks = Task.includes(:user)    
    
  end
  
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
    @task.user = @current_user
  end

  def edit
    @task = Task.includes(:user).find(params[:id])    
  end

  def create
    @task = Task.new(task_params)
    @task.user = @current_user

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end  

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title, :text)
    end
  
end
