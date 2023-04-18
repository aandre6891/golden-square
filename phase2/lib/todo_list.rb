class TodoList
  def initialize
    @task = []
  end

  def add(task)
    @task << task
  end
  
  def complete(task)
    fail "task not in the list" unless @task.include? task
    @task.delete(task)
  end

  def list
    return @task
  end
end