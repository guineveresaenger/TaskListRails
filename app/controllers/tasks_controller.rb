class TasksController < ApplicationController

  before_action :validate_user
  before_action :get_task, only: [:show, :edit, :update]
  before_action :validate_task, only: [:show, :edit]

  def index
    @user = User.find(session[:user_id])
    @tasks = Task.where(user_id: session[:user_id])
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end

  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed_at)
  end

  def validate_user
    if session[:user_id].nil?
      redirect_to sessions_path
    end
  end

  def validate_task
    if session[:user_id] != @task.user_id
      redirect_to sessions_path
    end
  end

  def get_task
    @task = Task.find(params[:id])
  end

end
