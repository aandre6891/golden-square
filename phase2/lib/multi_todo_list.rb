# File: lib/todo_list.rb
class TodoList
  def initialize
    @todo_list = []
    @complete_todos = []
  end

  def add(todo) # todo is an instance of Todo
    @todo_list << todo
  end

  def incomplete
    return @todo_list
  end

  def complete
    return @complete_todos
  end

  def give_up!
    # Marks all todos as complete
  end
end