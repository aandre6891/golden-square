class Todo
  def initialize(task) # task is a string
    @task = task
    @done = false
  end

  def task
    return @task
  end

  def mark_done!
    @done = true
  end

  def done?
    if @done == true
      return true
    else
      return false
    end
  end
end