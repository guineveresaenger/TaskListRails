class TasksController < ApplicationController

  def index
    @tasks = [
      {
        name: "laundry",
        description: "Wash all the clothes!",
        status: "TODO",
        date: "ASAP"
      },
      {
        name: "dishes",
        description: "Wash all the pots!",
        status: "TODO",
        date: "Tonight"
      },
      {
        name: "homework",
        description: "Code all the things!",
        status: "TODO",
        date: "tonight"
      },
      {
        name: "Cuddles",
        description: "Cuddle all the people!",
        status: "Ongoing",
        date: "Every day whenever possible"
      }
    ]


  end

  def show
    @tasks = [
      {
        name: "laundry",
        description: "Wash all the clothes!",
        status: "TODO",
        date: "ASAP"
      },
      {
        name: "dishes",
        description: "Wash all the pots!",
        status: "TODO",
        date: "Tonight"
      },
      {
        name: "homework",
        description: "Code all the things!",
        status: "TODO",
        date: "tonight"
      },
      {
        name: "Cuddles",
        description: "Cuddle all the people!",
        status: "Ongoing",
        date: "Every day whenever possible"
      }
    ]

    puts "THIS IS THE ID: #{params[:id]}"

    begin
      task_id = Integer(params[:id])
      if task_id >=0 && task_id < @tasks.length
        @task = @tasks[task_id]
      else
        @task = "Invalid article ID"
        render status: 404
      end
    rescue ArgumentError
      @task = "Invalid article ID"
      render status: 404
    end
    puts @task

  end

end
