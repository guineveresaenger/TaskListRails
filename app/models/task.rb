class Task < ActiveRecord::Base
  attr_accessor :done

  def set_completion_time
    if params[:done] == true
      @task.completed_at = Time.now
    end
  end
end
