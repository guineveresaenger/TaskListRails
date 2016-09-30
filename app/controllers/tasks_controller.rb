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

    # @task.set_completion_time

    if task_params[:done] == "true"
      @task.completed_at = Time.now
    end
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end

    puts "MY DONENESS IS: #{@task.done}"
  end


  def edit
    @task = Task.find(params[:id])
  end


  def update
    @task = Task.find(params[:id])


    # @task.set_completion_time
    if task_params[:done] == "true"
      @task.completed_at = Time.now
    end



    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
    puts "MY DONENESS IS: #{@task.done}"
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
