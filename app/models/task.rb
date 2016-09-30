class Task < ActiveRecord::Base
  attr_accessor :done

  def set_completion_time
    if @done == "1"
      completed_at = Time.now
    else
      completed_at = 100
    end
  end
end
