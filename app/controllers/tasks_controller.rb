class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

  end

  def new; end

  def create

    # try = Task.new(params[:task])
    # try.save
    #
    redirect_to tasks_path

    # new_task = {
    #   title: params[:title],
    #   description: params[:description]
    # }
    #
    # puts "HERE IS THE NEW TASK OMG REALLY? #{new_task}"
    # redirect_to_tasks_path
  end

end
