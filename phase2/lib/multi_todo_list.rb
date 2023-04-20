class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    @todo_list << todo
  end

  def incomplete
    return @todo_list
  end

  def complete
    @todo_list.select do |todo|
      todo if todo.instance_variable_get(:@done)
    end
  end

  def give_up!
    # Marks all todos as complete
  end
end

