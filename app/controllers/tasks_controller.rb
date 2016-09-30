class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

  end

  def new
    @task = Task.new
  end

  def create

    @task = Task.new(task_params)
    puts task_params[:done]
    if task_params[:done] == "1"
      @task.completed_at = Time.now
      @task.save
    end

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit(:title, :description, :done)
  end

end
